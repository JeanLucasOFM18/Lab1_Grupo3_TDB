package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Emergencia;
import com.grupo3.Lab1.repository.EmergenciaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EmergenciaService {

    private final EmergenciaRepository emergenciaRepository;
    EmergenciaService(EmergenciaRepository emergenciaRepository){
        this.emergenciaRepository = emergenciaRepository;
    }

    @GetMapping("/Emergencia")
    public List<Emergencia> getAllEmergencia(){
        List<Emergencia> list = emergenciaRepository.getAllEmergencia();
        return list;
    }

    @PostMapping("/Emergencia")
    public String createEmergencia(@RequestBody Emergencia emergencia){
        Emergencia result = emergenciaRepository.createEmergencia(emergencia);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/Emergencia/update")
    public String updateEmergencia(@RequestBody Emergencia emergencia){
        Emergencia result = emergenciaRepository.updateEmergencia(emergencia);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/Emergencia/delete/{id}")
    public String deleteEmergencia(@PathVariable Integer id){
        emergenciaRepository.deleteEmergenciaById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
