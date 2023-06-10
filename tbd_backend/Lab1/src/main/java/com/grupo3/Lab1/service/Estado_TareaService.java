package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Estado_Tarea;
import com.grupo3.Lab1.repository.Estado_TareaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class Estado_TareaService {

    private final Estado_TareaRepository estado_tareaRepository;
    Estado_TareaService(Estado_TareaRepository estado_tareaRepository){
        this.estado_tareaRepository = estado_tareaRepository;
    }

    @GetMapping("/estados_tarea")
    public List<Estado_Tarea> getAllEstado_Tarea(){
        List<Estado_Tarea> list = estado_tareaRepository.getAllEstado_Tarea();
        return list;
    }

    @PostMapping("/estados_tarea")
    public String createEstado_Tarea(@RequestBody Estado_Tarea estado_tarea){
        Estado_Tarea result = estado_tareaRepository.createEstado_Tarea(estado_tarea);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/estados_tarea/update")
    public String updateEstado_Tarea(@RequestBody Estado_Tarea estado_tarea){
        Estado_Tarea result = estado_tareaRepository.updateEstado_Tarea(estado_tarea);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/estados_tarea/delete/{id}")
    public String deleteEstado_Tarea(@PathVariable Integer id){
        estado_tareaRepository.deleteEstado_TareaById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
