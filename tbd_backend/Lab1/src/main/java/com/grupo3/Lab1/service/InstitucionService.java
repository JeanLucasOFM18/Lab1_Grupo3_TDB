package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Institucion;
import com.grupo3.Lab1.repository.InstitucionRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class InstitucionService {

    private final InstitucionRepository institucionRepository;

    public InstitucionService(InstitucionRepository institucionRepository) {
        this.institucionRepository = institucionRepository;
    }

    @GetMapping("/institucion")
    public List<Institucion> getAllEme_Habilidad(){
        List<Institucion> list = institucionRepository.getAllInstitucion();
        return list;
    }

    @PostMapping("/institucion")
    public String createInstitucion(@RequestBody Institucion institucion){
        Institucion result = institucionRepository.createInstitucion(institucion);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/institucion/update")
    public String updateInstitucion(@RequestBody Institucion institucion){
        Institucion result = institucionRepository.updateInstitucion(institucion);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/institucion/delete/{id}")
    public String deleteInstitucion(@PathVariable Integer id){
        institucionRepository.deleteInstitucionById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }
}
