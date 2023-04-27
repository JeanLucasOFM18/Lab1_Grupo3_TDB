package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Tarea;
import com.grupo3.Lab1.repository.TareaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class TareaService {

    private final TareaRepository tareaRepository;
    TareaService(TareaRepository tareaRepository){this.tareaRepository = tareaRepository;}

    @GetMapping("/tareas")
    public List<Tarea> getAllTarea() {
        return tareaRepository.getAllTarea();
    }

    @PostMapping("/tareas")
    @ResponseBody
    public Tarea crearTarea(@RequestBody Tarea tarea) {
        Tarea tareaCreada = tareaRepository.createTarea(tarea);
        return tareaCreada;
    }

}
