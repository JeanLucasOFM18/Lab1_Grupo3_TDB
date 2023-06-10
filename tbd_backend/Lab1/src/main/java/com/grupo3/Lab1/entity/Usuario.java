package com.grupo3.Lab1.entity;

public class Usuario {

    private Integer id;
    private String correo;
    private String password;
    private String rol;

    public Usuario(Integer id, String correo, String password, String rol) {
        this.id = id;
        this.correo = correo;
        this.password = password;
        this.rol = rol;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
