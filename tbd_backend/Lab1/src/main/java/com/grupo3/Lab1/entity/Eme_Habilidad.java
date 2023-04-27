package com.grupo3.Lab1.entity;

public class Eme_Habilidad {

    private Integer id;
    private Integer id_emergencia;
    private Integer id_habilidad;

    public Eme_Habilidad(Integer id, Integer id_emergencia, Integer id_habilidad) {
        this.id = id;
        this.id_emergencia = id_emergencia;
        this.id_habilidad = id_habilidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId_emergencia() {
        return id_emergencia;
    }

    public void setId_emergencia(Integer id_emergencia) {
        this.id_emergencia = id_emergencia;
    }

    public Integer getId_habilidad() {
        return id_habilidad;
    }

    public void setId_habilidad(Integer id_habilidad) {
        this.id_habilidad = id_habilidad;
    }
}
