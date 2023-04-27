package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Emergencia;
import com.grupo3.Lab1.entity.Estado_Tarea;

import java.util.List;

public interface Estado_TareaRepository {

    public List<Estado_Tarea> getAllEstado_Tarea();
    public Estado_Tarea createEstado_Tarea(Estado_Tarea estado_tarea);
    public Estado_Tarea updateEstado_Tarea(Estado_Tarea estado_tarea);
    public void deleteEstado_TareaById(Integer id);
}
