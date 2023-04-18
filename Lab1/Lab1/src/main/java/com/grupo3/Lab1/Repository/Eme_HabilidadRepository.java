package com.grupo3.Lab1.Repository;

import com.grupo3.Lab1.Entity.Eme_Habilidad;

import java.util.List;

public interface Eme_HabilidadRepository {

    public List<Eme_Habilidad> getAllEme_Habilidad();
    public Eme_Habilidad createEme_Habilidad(Eme_Habilidad eme_habilidad);
    public Eme_Habilidad updateEme_Habilidad(Eme_Habilidad eme_habilidad);
    public void deleteEme_HabilidadById(Integer id);
}
