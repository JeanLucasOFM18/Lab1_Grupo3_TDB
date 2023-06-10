package com.grupo3.Lab1.entity;

public class Reporte {

    private Integer id_usuario;

    private String nombre_usuario;

    private String operacion;

    private String tabla;

    private Integer n_veces;

    public Reporte(Integer id_usuario, String nombre_usuario, String operacion, String tabla, Integer n_veces) {
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.operacion = operacion;
        this.tabla = tabla;
        this.n_veces = n_veces;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public String getOperacion() {
        return operacion;
    }

    public String getTabla() {
        return tabla;
    }

    public Integer getN_veces() {
        return n_veces;
    }
}
