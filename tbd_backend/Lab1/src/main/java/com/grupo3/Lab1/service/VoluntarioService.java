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

    @PostMapping("/voluntario")
    public String createVoluntario(@RequestBody Voluntario voluntario){
        Voluntario result = voluntarioRepository.createVoluntario(voluntario);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/voluntario/update")
    public String updateVoluntario(@RequestBody Voluntario voluntario){
        Voluntario result = voluntarioRepository.updateVoluntario(voluntario);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/voluntario/delete/{id}")
    public String deleteVoluntario(@PathVariable Integer id){
        voluntarioRepository.deleteVoluntarioById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

    @PutMapping("/voluntario/{id}/ubicacion")
    public String setUbicacionByCoordinates(@PathVariable Integer id,
                                            @RequestParam double latitud,
                                            @RequestParam double longitud) {

        Voluntario voluntario = voluntarioRepository.getVoluntarioById(id);

        if (voluntario == null) {
            return "No se encontró el voluntario con el ID: " + id;
        }
        voluntario.setUbicacion(latitud, longitud);
        voluntarioRepository.updateVoluntario(voluntario);
        return "Se ha actualizado la ubicación del voluntario con el ID: " + id;
    }
}