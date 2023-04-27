package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Voluntario;
import com.grupo3.Lab1.repository.VoluntarioRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class VoluntarioService {

    private final VoluntarioRepository voluntarioRepository;

    public VoluntarioService(VoluntarioRepository voluntarioRepository) {
        this.voluntarioRepository = voluntarioRepository;
    }

    @GetMapping("/voluntario")
    public List<Voluntario> getAllVoluntario(){
        List<Voluntario> list = voluntarioRepository.getAllVoluntario();
        return list;
    }

    @PostMapping("/Voluntario")
    public String createVoluntario(@RequestBody Voluntario voluntario){
        Voluntario result = voluntarioRepository.createVoluntario(voluntario);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/Voluntario/update")
    public String updateVoluntario(@RequestBody Voluntario voluntario){
        Voluntario result = voluntarioRepository.updateVoluntario(voluntario);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/Voluntario/delete/{id}")
    public String deleteVoluntario(@PathVariable Integer id){
        voluntarioRepository.deleteVoluntarioById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }
}
