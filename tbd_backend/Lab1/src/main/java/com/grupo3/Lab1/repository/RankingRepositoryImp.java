package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Ranking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class RankingRepositoryImp implements RankingRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Ranking> getAllRanking(){
        String sql = "SELECT * FROM ranking";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Ranking.class);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Ranking createRanking(Ranking ranking) {
        String sql = "INSERT INTO ranking (id, id_voluntario, id_tarea, puntaje) " +
                "Values (:id, :id_voluntario, :id_tarea, :puntaje)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql, true)
                    .bind(ranking)
                    .executeUpdate()
                    .getKey();
            ranking.setId(id);
            return ranking;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } finally {
            conn.close();
        }
    }

    @Override
    public Ranking updateRanking(Ranking ranking){
        String sql = "UPDATE institucion SET id_voluntario = :id_voluntario, id_tarea = :id_tarea, puntaje = :puntaje" +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(ranking)
                    .executeUpdate();
            return ranking;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteRankingById(Integer id) {
        String sql = "DELETE FROM ranking WHERE id = :id";
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
