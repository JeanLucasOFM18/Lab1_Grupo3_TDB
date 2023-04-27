package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Tarea_Habilidad;

import java.util.List;

public interface Tarea_HabilidadRepository {

    public List<Tarea_Habilidad> getAllTarea_Habilidad();

    public Tarea_Habilidad createTarea_Habilidad(Tarea_Habilidad tarea_habilidad);

    public Tarea_Habilidad updateTarea_Habilidad(Tarea_Habilidad tarea_habilidad);

    public void deleteTarea_HabilidadById(Integer id);
}
