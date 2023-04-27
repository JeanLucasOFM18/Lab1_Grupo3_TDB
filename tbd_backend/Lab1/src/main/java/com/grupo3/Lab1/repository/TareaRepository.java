package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Tarea;

import java.util.List;

public interface TareaRepository {

    public List<Tarea> getAllTarea();

    public Tarea createTarea(Tarea tarea);

    public Tarea updateTarea(Tarea tarea);

    public void deleteTareaById(Integer id);
}
