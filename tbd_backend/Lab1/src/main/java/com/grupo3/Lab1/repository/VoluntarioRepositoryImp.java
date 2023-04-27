package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Emergencia;
import com.grupo3.Lab1.entity.Tarea;
import com.grupo3.Lab1.entity.Voluntario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class VoluntarioRepositoryImp implements VoluntarioRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Voluntario> getAllVoluntario() {
        String sql = "SELECT * FROM voluntario";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Voluntario.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Voluntario createVoluntario(Voluntario voluntario) {
        String sql = "INSERT INTO voluntario (id, nombre, fecha_nacimiento) " +
                "VALUES (:id, :nombre, :fecha_nacimiento)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(voluntario)
                    .executeUpdate()
                    .getKey();
            voluntario.setId(id);
            return voluntario;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Voluntario updateVoluntario(Voluntario voluntario) {
        String sql = "UPDATE voluntario SET nombre = :nombre, fecha_nacimiento = :fecha_nacimiento"
                + " WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(voluntario)
                    .executeUpdate();
            return voluntario;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteVoluntarioById(Integer id) {
        String sql = "DELETE FROM voluntario WHERE id = :id";
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
