package com.grupo3.Lab1.Entity;

public class Ranking {

    private Integer id;
    private Integer id_voluntario;
    private Integer id_tarea;
    private Integer puntaje;

    public Ranking(Integer id, Integer id_voluntario, Integer id_tarea, Integer puntaje) {
        this.id = id;
        this.id_voluntario = id_voluntario;
        this.id_tarea = id_tarea;
        this.puntaje = puntaje;
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

    public Integer getId_tarea() {
        return id_tarea;
    }

    public void setId_tarea(Integer id_tarea) {
        this.id_tarea = id_tarea;
    }

    public Integer getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(Integer puntaje) {
        this.puntaje = puntaje;
    }
}
