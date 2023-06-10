package com.grupo3.Lab1.repository;

import com.grupo3.Lab1.entity.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class UsuarioRepositoryImp implements UsuarioRepository{

    @Autowired
    private Sql2o sql2o;

    @Override
    public List<Usuario> getAllUsuario(){
        String sql = "SELECT * FROM usuario";
        Connection conn = sql2o.open();
        try (conn) {
            return conn.createQuery(sql).executeAndFetch(Usuario.class);
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Usuario createUsuario(Usuario usuario){
        String sql = "INSERT INTO usuario (correo, password, rol) " +
                "VALUES (:correo, :password, :rol)";
        Connection conn = sql2o.open();
        try (conn) {
            int id = (int) conn.createQuery(sql,true)
                    .bind(usuario)
                    .executeUpdate()
                    .getKey();
            usuario.setId(id);
            return usuario;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public Usuario updateUsuario(Usuario usuario){
        String sql = "UPDATE usuario SET correo = :correo, password = :password, rol = :rol " +
                "WHERE id = :id";
        Connection conn = sql2o.open();
        try (conn) {
            conn.createQuery(sql)
                    .bind(usuario)
                    .executeUpdate();
            return usuario;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }finally{
            conn.close();
        }
    }

    @Override
    public void deleteUsuarioById(Integer id){
        String sql = "DELETE FROM usuario WHERE id = :id";
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
