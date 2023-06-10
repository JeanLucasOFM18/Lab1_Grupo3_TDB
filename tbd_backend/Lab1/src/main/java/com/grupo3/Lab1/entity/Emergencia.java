package com.grupo3.Lab1.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.locationtech.jts.geom.Geometry;

import org.locationtech.jts.geom.*;
import java.util.Date;

public class Emergencia {

    private Integer id;
    private String nombre;
    private String descripcion;
    private Date fecha_inicio;
    private Date fecha_termino;
    @JsonIgnore

    private Geometry ubicacion;
    private Integer id_institucion;

    public Emergencia(Integer id, String nombre, String descripcion, Date fecha_inicio, Date fecha_termino, double latitud, double longitud, Integer id_institucion) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.fecha_inicio = fecha_inicio;
        this.fecha_termino = fecha_termino;
        this.ubicacion = crearGeometriaConCordenadas(latitud, longitud);
        this.id_institucion = id_institucion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_termino() {
        return fecha_termino;
    }

    public void setFecha_termino(Date fecha_termino) {
        this.fecha_termino = fecha_termino;
    }

    public Integer getId_institucion() {
        return id_institucion;
    }

    public void setId_institucion(Integer id_institucion) {
        this.id_institucion = id_institucion;
    }

    public Geometry getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(Geometry ubicacion) {
        this.ubicacion = ubicacion;
    }

    private Geometry crearGeometriaConCordenadas(double latitud, double longitud) {
        GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 4326);
        Coordinate coordinate = new Coordinate(longitud, latitud);
        Point point = geometryFactory.createPoint(coordinate);
        return point;
    }
}
