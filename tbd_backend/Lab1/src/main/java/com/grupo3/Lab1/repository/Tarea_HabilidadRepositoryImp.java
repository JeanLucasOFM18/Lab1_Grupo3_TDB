package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Tarea_Habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Tarea_HabilidadRepositoryImp implements Tarea_HabilidadRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Tarea_Habilidad> getAllTarea_Habilidad() {
        String sql = "SELECT * FROM tarea_habilidad";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Tarea_Habilidad.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Tarea_Habilidad createTarea_Habilidad(Tarea_Habilidad tarea_habilidad) {
        String sql = "INSERT INTO tarea_habilidad (id, id_tarea, id_eme_habilidad) " +
                "VALUES (:id, :id_tarea, :id_eme_habilidad)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(tarea_habilidad)
                    .executeUpdate()
                    .getKey();
            tarea_habilidad.setId(id);
            return tarea_habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Tarea_Habilidad updateTarea_Habilidad(Tarea_Habilidad tarea_habilidad) {
        String sql = "UPDATE tarea_habilidad SET id_tarea = :id_tarea, id_habilidad = :id_habilidad " +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(tarea_habilidad)
                    .executeUpdate();
            return tarea_habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteTarea_HabilidadById(Integer id) {
        String sql = "DELETE FROM tarea_habilidad WHERE id = :id";
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
