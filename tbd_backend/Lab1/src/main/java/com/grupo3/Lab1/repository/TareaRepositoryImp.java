package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Tarea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class TareaRepositoryImp implements TareaRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Tarea> getAllTarea() {
        String sql = "SELECT * FROM tarea";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Tarea.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    public Tarea createTarea(Tarea tarea) {
        String sql = "INSERT INTO tarea (id, nombre, descripcion, cantidad_requeridos, cantidad_inscritos, " +
                "id_emergencia, id_estado) " +
                "Values (:id, :nombre, :descripcion, :cantidad_requeridos, :cantidad_inscritos, :id_emergencia, :id_estado)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql, true)
                    .bind(tarea)
                    .executeUpdate()
                    .getKey();
            tarea.setId(id);
            return tarea;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Tarea updateTarea(Tarea tarea) {
        String sql = "UPDATE tarea SET nombre = :nombre, descripcion = :descripcion, " +
                "cantidad_requeridos = :cantidad_requeridos, cantidad_inscritos = :cantidad_inscritos, " +
                "id_emergencia = :id_emergencia, id_estado = :id_estado" +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(tarea)
                    .executeUpdate();
            return tarea;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public void deleteTareaById(Integer id) {
        String sql = "DELETE FROM tarea WHERE id = :id";
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
