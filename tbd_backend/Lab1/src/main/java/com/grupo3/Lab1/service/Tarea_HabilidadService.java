package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Tarea;
import com.grupo3.Lab1.entity.Tarea_Habilidad;
import com.grupo3.Lab1.repository.TareaRepository;
import com.grupo3.Lab1.repository.Tarea_HabilidadRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class Tarea_HabilidadService {

    private final Tarea_HabilidadRepository tarea_habilidadRepository;
    Tarea_HabilidadService(Tarea_HabilidadRepository tarea_habilidadRepository){this.tarea_habilidadRepository = tarea_habilidadRepository;}

    @GetMapping("/tarea_habilidad")
    public List<Tarea_Habilidad> getAllTareaHabilidad() {
        return tarea_habilidadRepository.getAllTarea_Habilidad();
    }

    @PostMapping("/tarea_habilidad")
    @ResponseBody
    public Tarea_Habilidad crearTareaHabilidad(@RequestBody Tarea_Habilidad tarea_habilidad) {
        Tarea_Habilidad tareaHabilidadCreada = tarea_habilidadRepository.createTarea_Habilidad(tarea_habilidad);
        return tareaHabilidadCreada;
    }

}
