package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Emergencia;
import com.grupo3.Lab1.repository.EmergenciaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class EmergenciaService {

    private final EmergenciaRepository emergenciaRepository;
    EmergenciaService(EmergenciaRepository emergenciaRepository){
        this.emergenciaRepository = emergenciaRepository;
    }

    @GetMapping("/emergencias")
    public List<Emergencia> getAllEmergencia(){
        return emergenciaRepository.getAllEmergencia();
    }

    @PostMapping("/emergencias")
    public String createEmergencia(@RequestBody Emergencia emergencia){
        Emergencia result = emergenciaRepository.createEmergencia(emergencia);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/emergencia/update")
    public String updateEmergencia(@RequestBody Emergencia emergencia){
        Emergencia result = emergenciaRepository.updateEmergencia(emergencia);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/emergencia/delete/{id}")
    public String deleteEmergencia(@PathVariable Integer id){
        emergenciaRepository.deleteEmergenciaById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
