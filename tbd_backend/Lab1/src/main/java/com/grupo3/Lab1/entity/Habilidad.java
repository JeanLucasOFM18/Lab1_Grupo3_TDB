package com.grupo3.Lab1.entity;

public class Habilidad {

    private Integer id;
    private String habilidad;

    public Habilidad(Integer id, String habilidad) {
        this.id = id;
        this.habilidad = habilidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHabilidad() {
        return habilidad;
    }

    public void setHabilidad(String habilidad) {
        this.habilidad = habilidad;
    }
}
