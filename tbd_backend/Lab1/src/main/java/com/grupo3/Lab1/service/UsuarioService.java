package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.TokenInfo;
import com.grupo3.Lab1.entity.Usuario;
import com.grupo3.Lab1.repository.UsuarioRepository;
import com.grupo3.Lab1.security.JwtUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;

@CrossOrigin
@RestController
public class UsuarioService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    UserDetailsService usuarioDetailsService;

    @Autowired
    private JwtUtilService jwtUtilService;
    private static final Logger logger = LoggerFactory.getLogger(UsuarioService.class);

    private final UsuarioRepository usuarioRepository;

    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @GetMapping("/usuario")
    public List<Usuario> getAllUsuario(){
        List<Usuario> list = usuarioRepository.getAllUsuario();
        return list;
    }

    @PostMapping("/register")
    public Usuario register(@RequestBody Usuario usuario){
        String passwordEncriptada = BCrypt.hashpw(usuario.getPassword(), BCrypt.gensalt());
        usuario.setPassword(passwordEncriptada);
        usuario.setRol("ADMIN");
        return usuarioRepository.createUsuario(usuario);
    }

    @PutMapping("/usuario/update")
    public String updateUsuario(@RequestBody Usuario usuario){
        Usuario result = usuarioRepository.updateUsuario(usuario);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/usuario/delete/{id}")
    public String deleteUsuario(@PathVariable Integer id){
        usuarioRepository.deleteUsuarioById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

    @PostMapping("/login")
    public ResponseEntity<TokenInfo> login(@RequestBody Usuario usuario) {
        if(usuarioRepository.getUsuarioByUsername(usuario.getUsername()) != null){
            logger.info("Autenticando al usuario {}", usuario.getUsername());

            Usuario usuarioReal = usuarioRepository.getUsuarioByUsername(usuario.getUsername());
            if(BCrypt.checkpw(usuario.getPassword(), usuarioReal.getPassword())){
                authenticationManager.authenticate(
                        new UsernamePasswordAuthenticationToken(usuario.getUsername(),
                                usuario.getPassword()));

                final UserDetails userDetails = usuarioDetailsService.loadUserByUsername(
                        usuarioReal.getUsername());

                final String jwt = jwtUtilService.generateToken(userDetails);

                logger.info("Autenticacion correcta");

                return ResponseEntity.ok(new TokenInfo(jwt));

            }
            else {
                logger.info("Usuario con contraseña erronea");
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
        }
        else {
            logger.info("Usuario no encontrado");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }
}