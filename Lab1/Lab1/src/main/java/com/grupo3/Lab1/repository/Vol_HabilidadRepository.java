package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Vol_Habilidad;

import java.util.List;

public interface Vol_HabilidadRepository {

    public List<Vol_Habilidad> getAllVol_Habilidad();

    public Vol_Habilidad createVol_Habilidad(Vol_Habilidad vol_habilidad);

    public Vol_Habilidad updateVol_Habilidad(Vol_Habilidad vol_habilidad);

    public void deleteVol_HabilidadById(Integer id);
}
