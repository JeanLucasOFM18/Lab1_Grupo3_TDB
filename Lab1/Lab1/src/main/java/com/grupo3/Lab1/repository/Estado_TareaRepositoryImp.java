package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Estado_Tarea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Estado_TareaRepositoryImp implements Estado_TareaRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Estado_Tarea> getAllEstado_Tarea() {
        String sql = "SELECT * FROM estado_tarea";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Estado_Tarea.class);
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Estado_Tarea createEstado_Tarea(Estado_Tarea estado_tarea) {
        String sql = "INSERT INTO estado_tarea (id, estado) " +
                "VALUES (:id, :estado)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(estado_tarea)
                    .executeUpdate()
                    .getKey();
            estado_tarea.setId(id);
            return estado_tarea;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Estado_Tarea updateEstado_Tarea(Estado_Tarea estado_tarea) {
        String sql = "UPDATE estado_tarea SET estado = :estado"
                + " WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(estado_tarea)
                    .executeUpdate();
            return estado_tarea;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteEstado_TareaById(Integer id) {
        String sql = "DELETE FROM estado_tarea WHERE id = :id";
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
