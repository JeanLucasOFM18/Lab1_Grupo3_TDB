package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Eme_Habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Eme_HabilidadRepositoryImp implements Eme_HabilidadRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Eme_Habilidad> getAllEme_Habilidad() {
        String sql = "SELECT * FROM eme_habilidad";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Eme_Habilidad.class);
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Eme_Habilidad createEme_Habilidad(Eme_Habilidad eme_habilidad) {
        String sql = "INSERT INTO eme_habilidad (id, id_emergencia, id_habilidad) " +
                "VALUES (:id, :id_emergencia, :id_habilidad)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(eme_habilidad)
                    .executeUpdate()
                    .getKey();
            eme_habilidad.setId(id);
            return eme_habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Eme_Habilidad updateEme_Habilidad(Eme_Habilidad eme_habilidad) {
        String sql = "UPDATE eme_habilidad SET id_emergencia = :id_emergencia, id_habilidad = :id_habilidad " +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(eme_habilidad)
                    .executeUpdate();
            return eme_habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteEme_HabilidadById(Integer id) {
        String sql = "DELETE FROM eme_habilidad WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }finally{
            conn.close();
        }
    }
}
