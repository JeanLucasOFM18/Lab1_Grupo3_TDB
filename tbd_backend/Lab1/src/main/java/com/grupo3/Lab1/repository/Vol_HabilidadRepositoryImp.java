package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Vol_Habilidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class Vol_HabilidadRepositoryImp implements Vol_HabilidadRepository {

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Vol_Habilidad> getAllVol_Habilidad() {
        String sql = "SELECT * FROM vol_habilidad";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Vol_Habilidad.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Vol_Habilidad createVol_Habilidad(Vol_Habilidad vol_habilidad) {
        String sql = "INSERT INTO vol_habilidad (id, id_voluntario, id_habilidad) " +
                "VALUES (:id, :id_voluntario, :id_habilidad)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(vol_habilidad)
                    .executeUpdate()
                    .getKey();
            vol_habilidad.setId(id);
            return vol_habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Vol_Habilidad updateVol_Habilidad(Vol_Habilidad vol_habilidad) {
        String sql = "UPDATE vol_habilidad SET id_voluntario = :id_voluntario, id_habilidad = :id_habilidad " +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(vol_habilidad)
                    .executeUpdate();
            return vol_habilidad;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteVol_HabilidadById(Integer id) {
        String sql = "DELETE FROM vol_habilidad WHERE id = :id";
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
