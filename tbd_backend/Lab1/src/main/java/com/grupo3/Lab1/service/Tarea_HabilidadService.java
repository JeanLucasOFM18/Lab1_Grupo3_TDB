package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Tarea_Habilidad;
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

    @PutMapping("/tarea_habilidad/update")
    public String updateTarea_Habilidad(@RequestBody Tarea_Habilidad tarea_habilidad){
        Tarea_Habilidad result = tarea_habilidadRepository.updateTarea_Habilidad(tarea_habilidad);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/tarea_habilidad/delete/{id}")
    public String deleteTarea_Habilidad(@PathVariable Integer id){
        tarea_habilidadRepository.deleteTarea_HabilidadById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
