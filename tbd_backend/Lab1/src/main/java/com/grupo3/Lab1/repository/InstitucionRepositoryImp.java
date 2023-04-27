package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Institucion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class InstitucionRepositoryImp implements InstitucionRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Institucion> getAllInstitucion() {
        String sql = "SELECT * FROM institucion";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Institucion.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Institucion createInstitucion(Institucion institucion) {
        String sql = "INSERT INTO institucion (id, nombre, direccion, contacto) " +
                "Values (:id, :nombre, :direccion, :contacto)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql, true)
                    .bind(institucion)
                    .executeUpdate()
                    .getKey();
            institucion.setId(id);
            return institucion;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Institucion updateInstitucion(Institucion institucion){
        String sql = "UPDATE institucion SET nombre = :nombre, direccion = :direccion, contacto = :contacto " +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(institucion)
                    .executeUpdate();
            return institucion;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteInstitucionById(Integer id) {
        String sql = "DELETE FROM institucion WHERE id = :id";
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
