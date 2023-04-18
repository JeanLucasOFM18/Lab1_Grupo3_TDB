package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Estado_Tarea;
import com.grupo3.Lab1.entity.Habilidad;

import java.util.List;

public interface HabilidadRepository {

    public List<Habilidad> getAllHabilidad();
    public Habilidad createHabilidad(Habilidad habilidad);
    public Habilidad updateHabilidad(Habilidad habilidad);
    public void deleteHabilidadById(Integer id);
}
