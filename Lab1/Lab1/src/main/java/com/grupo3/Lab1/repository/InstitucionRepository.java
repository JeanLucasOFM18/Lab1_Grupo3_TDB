package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Institucion;

import java.util.List;

public interface InstitucionRepository {

    public List<Institucion> getAllInstitucion();

    public Institucion createInstitucion(Institucion institucion);

    public Institucion updateInstitucion(Institucion institucion);

    public void deleteInstitucionById(Integer id);
}