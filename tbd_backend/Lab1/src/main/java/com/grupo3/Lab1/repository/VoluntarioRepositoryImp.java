package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Voluntario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;
import org.locationtech.jts.geom.*;

import java.util.List;

@Repository
public class VoluntarioRepositoryImp implements VoluntarioRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Voluntario> getAllVoluntario() {
        String sql = "SELECT * FROM voluntario";
        try (Connection conn = sql2o.open()) {
            return conn.createQuery(sql).executeAndFetch(Voluntario.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public Voluntario createVoluntario(Voluntario voluntario) {
        String sql = "INSERT INTO voluntario (id, nombre, fecha_nacimiento, ubicacion, latitud, longitud) " +
                "VALUES (:id, :nombre, :fecha_nacimiento, ST_GeomFromText(:ubicacionText, 4326), :latitud, :longitud)";

        try (Connection conn = sql2o.open()) {
            String ubicacionText = voluntario.getUbicacion().toText();
            int id = (int) conn.createQuery(sql, true)
                    .addParameter("ubicacionText", ubicacionText)
                    .addParameter("latitud", voluntario.getLatitud())
                    .addParameter("longitud", voluntario.getLongitud())
                    .bind(voluntario)
                    .executeUpdate()
                    .getKey();
            voluntario.setId(id);
            return voluntario;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public Voluntario updateVoluntario(Voluntario voluntario) {
        String sql = "UPDATE voluntario SET nombre = :nombre, fecha_nacimiento = :fecha_nacimiento, " +
                "ubicacion = ST_GeomFromText(:ubicacionText, 4326), latitud = :latitud, longitud = :longitud " +
                "WHERE id = :id";
        try (Connection conn = sql2o.open()) {
            String ubicacionText = voluntario.getUbicacion().toText();
            conn.createQuery(sql)
                    .addParameter("ubicacionText", ubicacionText)
                    .addParameter("latitud", voluntario.getLatitud())
                    .addParameter("longitud", voluntario.getLongitud())
                    .bind(voluntario)
                    .executeUpdate();
            return voluntario;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    @Override
    public void deleteVoluntarioById(Integer id) {
        String sql = "DELETE FROM voluntario WHERE id = :id";
        try (Connection conn = sql2o.open()) {
            conn.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public Voluntario getVoluntarioById(Integer id) {
        String sql = "SELECT * FROM voluntario WHERE id = :id";
        try (Connection conn = sql2o.open()) {
            return conn.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetchFirst(Voluntario.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
