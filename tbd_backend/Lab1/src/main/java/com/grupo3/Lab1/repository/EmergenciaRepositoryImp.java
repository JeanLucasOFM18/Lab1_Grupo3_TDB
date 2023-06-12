package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Emergencia;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Geometry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public class EmergenciaRepositoryImp implements EmergenciaRepository{

    @Autowired
    private Sql2o sql2o;

    @Override

    public List<Emergencia> getAllEmergencia() {
        String sql = "SELECT * FROM emergencia";
        try(Connection con = sql2o.open()){
            List<Map<String,Object>> results = con.createQuery(sql)
                    .executeAndFetchTable()
                    .asList();

            List<Emergencia> emergencias = new ArrayList<>();
            for (Map<String,Object> result : results) {
                Integer id = (Integer) result.get("id");
                String nombre = (String) result.get("nombre");
                String descripcion = (String) result.get("descripcion");
                Date fecha_inicio = (Date) result.get("fecha_inicio");
                Date fecha_termino = (Date) result.get("fecha_termino");
                // No necesitas convertir la ubicación a latitud y longitud.
                Integer id_institucion = (Integer) result.get("id_institucion");
                String region = (String) result.get("region");

                Emergencia emergencia = new Emergencia(region, id, nombre, descripcion, fecha_inicio, fecha_termino, id_institucion);
                emergencias.add(emergencia);
            }

            return emergencias;
        }
    }

    @Override
    public Emergencia createEmergencia(Emergencia emergencia) {
        String sql = "INSERT INTO emergencia (id, nombre, descripcion," +
                " fecha_inicio, fecha_termino, ubicacion, region, id_institucion) " +
                "VALUES (:id, :nombre, :descripcion, :fecha_inicio"
                +", :fecha_termino, ST_GeomFromText(:ubicacionText, 4326), :region, :id_institucion)";
        Connection conn = sql2o.open();
        try (conn) {
            // Aquí necesitas obtener la latitud y longitud desde emergencia.getUbicacion()
            // y usarlas para crear la geometría
            Geometry ubicacion = emergencia.getUbicacion();
            Coordinate coord = ubicacion.getCoordinate();
            String ubicacionText = "POINT(" + coord.x + " " + coord.y + ")";

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
