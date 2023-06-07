package com.grupo3.Lab1.entity;

import org.locationtech.jts.geom.*;

import java.util.Date;

public class Voluntario {

    private Integer id;
    private String nombre;
    private Date fecha_nacimiento;
    private Geometry ubicacion;
    /*
    public Voluntario(Integer id, String nombre, Date fecha_nacimiento) {
        this.id = id;
        this.nombre = nombre;
        this.fecha_nacimiento = fecha_nacimiento;

    } */
    public Voluntario(Integer id, String nombre, Date fecha_nacimiento, double latitud, double longitud) {
        this.id = id;
        this.nombre = nombre;
        this.fecha_nacimiento = fecha_nacimiento;
        this.ubicacion = crearGeometriaConCordenadas(latitud, longitud);
    }

    private Geometry crearGeometriaConCordenadas(double latitud, double longitud) {
        GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 4326);
        Coordinate coordinate = new Coordinate(longitud, latitud);
        Point point = geometryFactory.createPoint(coordinate);
        return point;
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

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
    public void setUbicacion(double latitud, double longitud){this.ubicacion = crearGeometriaConCordenadas(latitud, longitud);
    }
    public Geometry getUbicacion(){return ubicacion;}
}
