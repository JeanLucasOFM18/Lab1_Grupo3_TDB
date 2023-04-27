package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Eme_Habilidad;
import com.grupo3.Lab1.repository.Eme_HabilidadRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class Eme_HabilidadService {

    private final Eme_HabilidadRepository eme_habilidadRepository;
    Eme_HabilidadService(Eme_HabilidadRepository eme_habilidadRepository){
        this.eme_habilidadRepository = eme_habilidadRepository;
    }

    @GetMapping("/eme_habilidad")
    public List<Eme_Habilidad> getAllEme_Habilidad(){
        List<Eme_Habilidad> list = eme_habilidadRepository.getAllEme_Habilidad();
        return list;
    }

    @PostMapping("/Eme_Habilidad")
    public String createEme_Habilidad(@RequestBody Eme_Habilidad eme_habilidad){
        Eme_Habilidad result = eme_habilidadRepository.createEme_Habilidad(eme_habilidad);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/Eme_Habilidad/update")
    public String updateEme_Habilidad(@RequestBody Eme_Habilidad eme_habilidad){
        Eme_Habilidad result = eme_habilidadRepository.updateEme_Habilidad(eme_habilidad);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/Eme_Habilidad/delete/{id}")
    public String deleteEme_Habilidad(@PathVariable Integer id){
        eme_habilidadRepository.deleteEme_HabilidadById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
