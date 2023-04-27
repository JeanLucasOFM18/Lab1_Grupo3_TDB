package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Vol_Habilidad;
import com.grupo3.Lab1.repository.Vol_HabilidadRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class Vol_HabilidadService {

    private final Vol_HabilidadRepository vol_HabilidadRepository;

    public Vol_HabilidadService(Vol_HabilidadRepository volHabilidadRepository) {
        this.vol_HabilidadRepository = volHabilidadRepository;
    }
    @GetMapping("/vol_Habilidad")
    public List<Vol_Habilidad> getAllVol_Habilidad(){
        List<Vol_Habilidad> list = vol_HabilidadRepository.getAllVol_Habilidad();
        return list;
    }

    @PostMapping("/Vol_Habilidad")
    public String createVol_Habilidad(@RequestBody Vol_Habilidad vol_Habilidad){
        Vol_Habilidad result = vol_HabilidadRepository.createVol_Habilidad(vol_Habilidad);
        return "Se ha creado el elemento con id: " + result.getId();
    }

    @PutMapping("/Vol_Habilidad/update")
    public String updateVol_Habilidad(@RequestBody Vol_Habilidad vol_Habilidad){
        Vol_Habilidad result = vol_HabilidadRepository.updateVol_Habilidad(vol_Habilidad);
        return "Se ha actualizado el elemento con id: " + result.getId();
    }

    @DeleteMapping("/Vol_Habilidad/delete/{id}")
    public String deleteVol_Habilidad(@PathVariable Integer id){
        vol_HabilidadRepository.deleteVol_HabilidadById(id);
        return "Se ha eliminado el elemento con id: " + id;
    }

}
