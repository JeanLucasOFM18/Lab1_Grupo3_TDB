package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Emergencia;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class EmergenciaRepositoryImp implements EmergenciaRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Emergencia> getAllEmergencia() {
        String sql = "SELECT * FROM emergencia";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Emergencia.class);
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Emergencia createEmergencia(Emergencia emergencia) {
        String sql = "INSERT INTO emergencia (id, nombre, descripcion," +
                " fecha_inicio, fecha_termino, ubicacion, id_institucion) " +
                "VALUES (:id, :nombre, :descripcion, :fecha_inicio"
                +", :fecha_termino, ST_GeomFromText(:ubicacionText, 4326), :id_institucion)";
        Connection conn = sql2o.open();
        try (conn) {
            String ubicacionText = emergencia.getUbicacion().toText();
            int id = (int) conn.createQuery(sql,true)
                    .addParameter("ubicacionText", ubicacionText)
                    .bind(emergencia)
                    .executeUpdate()
                    .getKey();
            emergencia.setId(id);
            return emergencia;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Emergencia updateEmergencia(Emergencia emergencia) {
        String sql = "UPDATE emergencia SET nombre = :nombre" +
                ", descripcion = :descripcion, fecha_inicio = :fecha_inicio" +
                ", fecha_termino = :fecha_termino, id_institucion = :id_institucion"
                + " WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(emergencia)
                    .executeUpdate();
            return emergencia;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteEmergenciaById(Integer id) {
        String sql = "DELETE FROM emergencia WHERE id = :id";
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
