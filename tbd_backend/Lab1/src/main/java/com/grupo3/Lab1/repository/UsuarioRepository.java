package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Usuario;

import java.util.List;

public interface UsuarioRepository {

    public List<Usuario> getAllUsuario();
    public Usuario createUsuario(Usuario usuario);
    public Usuario updateUsuario(Usuario usuario);
    public void deleteUsuarioById(Integer id);
    public Usuario getUsuarioByUsername(String username);
}