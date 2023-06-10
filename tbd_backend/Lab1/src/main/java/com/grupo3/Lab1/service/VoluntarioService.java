package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Voluntario;
import com.grupo3.Lab1.repository.VoluntarioRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        if (result != null) {
            return "Se ha creado el voluntario con ID: " + result.getId();
        } else {
            return "No se pudo crear el voluntario.";
        }
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
    @GetMapping("/voluntario/ubicacion/{id}")
    public ResponseEntity<Map<String, Double>> getUbicacionVoluntario(@PathVariable Integer id){
        Voluntario voluntario = voluntarioRepository.getVoluntarioById(id);

        if (voluntario == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        Map<String, Double> response = new HashMap<>();
        response.put("latitud", voluntario.getLatitud());
        response.put("longitud", voluntario.getLongitud());

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    /*
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
     */
}
