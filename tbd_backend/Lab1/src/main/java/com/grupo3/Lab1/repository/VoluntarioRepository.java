package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Voluntario;

import java.util.List;

public interface VoluntarioRepository {

    public List<Voluntario> getAllVoluntario();

    public Voluntario createVoluntario(Voluntario voluntario);

    public Voluntario updateVoluntario(Voluntario voluntario);

    public void deleteVoluntarioById(Integer id);
}
