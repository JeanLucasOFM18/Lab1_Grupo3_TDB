package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class HabilidadRepositoryImp implements HabilidadRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Habilidad> getAllHabilidad() {
        String sql = "SELECT * FROM habilidad";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Habilidad.class);
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Habilidad createHabilidad(Habilidad habilidad) {
        String sql = "INSERT INTO habilidad (id, habilidad) " +
                "VALUES (:id, :habilidad)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(habilidad)
                    .executeUpdate()
                    .getKey();
            habilidad.setId(id);
            return habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Habilidad updateHabilidad(Habilidad habilidad) {
        String sql = "UPDATE habilidad SET habilidad = :habilidad"
                + " WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(habilidad)
                    .executeUpdate();
            return habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteHabilidadById(Integer id) {
        String sql = "DELETE FROM habilidad WHERE id = :id";
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
