package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Reporte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class ReporteRepositoryImp implements ReporteRepository{

    @Autowired
    private Sql2o sql2o;


    public List<Reporte> getAllReporte() {
        String call = "call reporte();";
        String sql = "SELECT * FROM reporte";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(call).executeUpdate();
            return conn.createQuery(sql).executeAndFetch(Reporte.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }
}
