package com.grupo3.Lab1.service;

import com.grupo3.Lab1.entity.Reporte;
import com.grupo3.Lab1.repository.ReporteRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
public class ReporteService {

    private final ReporteRepository reporteRepository;
    ReporteService(ReporteRepository reporteRepository){this.reporteRepository = reporteRepository;}


    @GetMapping("/reporte")
    public List<Reporte> getAllReporte() {
        return reporteRepository.getAllReporte();
    }
}