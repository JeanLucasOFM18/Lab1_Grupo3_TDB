package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Usuario;
import com.grupo3.Lab1.repository.UsuarioRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;

    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @GetMapping("/usuario")
    public List<Usuario> getAllUsuario(){
        List<Usuario> list = usuarioRepository.getAllUsuario();
        return list;
    }

    @PostMapping("/usuario")
    public Usuario register(@RequestBody Usuario usuario){
        return usuarioRepository.createUsuario(usuario);
    }

    @PutMapping("/usuario/update")
    public String updateUsuario(@RequestBody Usuario usuario){
        Usuario result = usuarioRepository.updateUsuario(usuario);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/usario/delete/{id}")
    public String deleteUsuario(@PathVariable Integer id){
        usuarioRepository.deleteUsuarioById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }
}
