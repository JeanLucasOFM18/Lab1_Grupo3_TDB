package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Emergencia;
import com.grupo3.Lab1.entity.Voluntario;
import com.grupo3.Lab1.repository.EmergenciaRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
    public String createEmergencia(@RequestBody Map<String, Object> requestBody) throws ParseException {
        // Obtener los campos necesarios del cuerpo de la solicitud
        Integer id = (Integer) requestBody.get("id");
        String nombre = (String) requestBody.get("nombre");
        String descripcion = (String) requestBody.get("descripcion");

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaInicio = format.parse((String) requestBody.get("fecha_inicio"));
        Date fechaTermino = format.parse((String) requestBody.get("fecha_termino"));

        Double latitud = (Double) requestBody.get("latitud");
        Double longitud = (Double) requestBody.get("longitud");
        Integer idInstitucion = (Integer) requestBody.get("id_institucion");
        String region = (String) requestBody.get("region");

        // Crear una instancia de Emergencia con los campos extraídos
        Emergencia emergencia = new Emergencia(id, nombre, descripcion, fechaInicio, fechaTermino, latitud, longitud, idInstitucion, region);

        // Resto de la lógica de creación de emergencia
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
