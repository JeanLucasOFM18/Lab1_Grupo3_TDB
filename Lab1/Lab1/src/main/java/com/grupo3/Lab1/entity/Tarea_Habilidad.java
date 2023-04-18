package com.grupo3.Lab1.entity;

public class Tarea_Habilidad {

    private Integer id;
    private Integer id_tarea;
    private Integer id_habilidad;

    public Tarea_Habilidad(Integer id, Integer id_tarea, Integer id_habilidad) {
        this.id = id;
        this.id_tarea = id_tarea;
        this.id_habilidad = id_habilidad;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId_tarea() {
        return id_tarea;
    }

    public void setId_tarea(Integer id_tarea) {
        this.id_tarea = id_tarea;
    }

    public Integer getId_habilidad() {
        return id_habilidad;
    }

    public void setId_habilidad(Integer id_habilidad) {
        this.id_habilidad = id_habilidad;
    }
}
