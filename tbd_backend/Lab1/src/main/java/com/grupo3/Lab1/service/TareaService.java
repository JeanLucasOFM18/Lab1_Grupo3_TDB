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

    @PostMapping("/tareas/{userid}")
    @ResponseBody
    public Tarea crearTarea(@RequestBody Tarea tarea, @PathVariable Integer userid) {
        Tarea tareaCreada = tareaRepository.createTarea(tarea, userid);
        return tareaCreada;
    }

    @PutMapping("/tareas/update/{userid}")
    public String updateTarea(@RequestBody Tarea tarea, @PathVariable Integer userid){
        Tarea result = tareaRepository.updateTarea(tarea, userid);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/tareas/delete/{userid}/{id}")
    public String deleteTarea(@PathVariable Integer userid, @PathVariable Integer id){
        tareaRepository.deleteTareaById(id, userid);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
