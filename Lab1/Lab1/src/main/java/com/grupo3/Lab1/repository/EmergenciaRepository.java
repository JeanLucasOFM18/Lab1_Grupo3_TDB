package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Emergencia;

import java.util.List;

public interface EmergenciaRepository {

    public List<Emergencia> getAllEmergencia();
    public Emergencia createEmergencia(Emergencia emergencia);
    public Emergencia updateEmergencia(Emergencia emergencia);
    public void deleteEmergenciaById(Integer id);
}
