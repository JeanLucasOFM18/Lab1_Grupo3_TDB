package com.grupo3.Lab1.entity;

public class Vol_Habilidad {

    private Integer id;
    private Integer id_voluntario;
    private Integer id_habilidad;

    public Vol_Habilidad(Integer id, Integer id_voluntario, Integer id_habilidad) {
        this.id = id;
        this.id_voluntario = id_voluntario;
        this.id_habilidad = id_habilidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId_voluntario() {
        return id_voluntario;
    }

    public void setId_voluntario(Integer id_voluntario) {
        this.id_voluntario = id_voluntario;
    }

    public Integer getId_habilidad() {
        return id_habilidad;
    }

    public void setId_habilidad(Integer id_habilidad) {
        this.id_habilidad = id_habilidad;
    }
}
