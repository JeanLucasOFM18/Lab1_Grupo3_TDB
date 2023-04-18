package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Habilidad;
import com.grupo3.Lab1.repository.HabilidadRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class HabilidadService {

    private final HabilidadRepository habilidadRepository;
    HabilidadService(HabilidadRepository habilidadRepository){
        this.habilidadRepository = habilidadRepository;
    }

    @GetMapping("/Habilidad")
    public List<Habilidad> getAllHabilidad(){
        List<Habilidad> list = habilidadRepository.getAllHabilidad();
        return list;
    }

    @PostMapping("/Habilidad")
    public String createHabilidad(@RequestBody Habilidad habilidad){
        Habilidad result = habilidadRepository.createHabilidad(habilidad);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/Habilidad/update")
    public String updateHabilidad(@RequestBody Habilidad habilidad){
        Habilidad result = habilidadRepository.updateHabilidad(habilidad);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/Habilidad/delete/{id}")
    public String deleteHabilidad(@PathVariable Integer id){
        habilidadRepository.deleteHabilidadById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
