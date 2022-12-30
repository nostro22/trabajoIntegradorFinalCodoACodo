/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import config.DBConn;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Mascota;
import java.util.LinkedList;
import java.util.List;
import java.util.Collections;


public class MascotaDAO {
    
    private Connection connection;
    
    public MascotaDAO(){
        DBConn conn = new DBConn();
        String DB = "centro";
        String userDB = "root";
        String passDB = "1234";
        connection = conn.getConnection(DB, userDB, passDB);
    }
    
    public Mascota getaMascotaById(int id) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        Mascota a = null;

        ps = connection.prepareStatement("SELECT * FROM mascotas WHERE id = ?");
        ps.setInt(1, id);

        rs = ps.executeQuery();
 
        if(rs.next()) {
            String nombre = rs.getString("nombre");
            String raza = rs.getString("raza");
            String cliente = rs.getString("cliente");
            String donante = rs.getString("donante");
            Double edad = rs.getDouble("edad");
            Date fecha = rs.getDate("fecha");
            

            a = new Mascota(id,nombre,  raza,  cliente,  donante,  edad, fecha);
        }
        return a;
    }
    
     public List<Mascota> getaMascotas() throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        List<Mascota> mascotas = new LinkedList<>();
        Mascota a = null;

        ps = connection.prepareStatement("SELECT * FROM mascotas WHERE 1 = 1");
        rs = ps.executeQuery();
 
        while(rs.next()) {
            int id = rs.getInt("id");
            String nombre = rs.getString("nombre");
            String raza = rs.getString("raza");
            String cliente = rs.getString("cliente"); 
            String donante = rs.getString("donante");
            Double edad = rs.getDouble("edad");
            Date fecha = rs.getDate("fecha");

            a = new Mascota(id, nombre,  raza,  cliente,  donante,  edad, fecha);
            mascotas.add(a);
        }
        return mascotas;
    }
    
    public int createMascota(Mascota a) throws SQLException {
        PreparedStatement ps;
        int lineasAfectadas;
        
        String pQuery = "INSERT INTO mascotas (nombre,  raza,  cliente,  donante,  edad, fecha)"
                + " VALUES(?, ?, ?, ?, ?, sysdate());";
        ps = connection.prepareStatement(pQuery);
        
        ps.setString(1, a.getNombre());
        ps.setString(2, a.getRaza());
        ps.setString(3, a.getCliente());
        ps.setString(4, a.getDonante());
        ps.setDouble(5, a.getEdad());
        
         
        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }

    public int updateMascota(Mascota a) throws SQLException {
        PreparedStatement ps;
        int lineasAfectadas;
        
        String pQuery = "UPDATE mascotas SET nombre = ?, raza = ?, cliente = ?, donante = ?, edad = ?"
                + " WHERE id = ?;";
        ps = connection.prepareStatement(pQuery);
        
        ps.setString(1, a.getNombre());
        ps.setString(2, a.getRaza());
        ps.setString(3, a.getCliente());
        ps.setString(4, a.getDonante());
        ps.setDouble(5, a.getEdad());
        ps.setInt(6, a.getId());

        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }
    
    public int deleteMascota(int id) throws SQLException {
        PreparedStatement ps;
        int lineasAfectadas;
        
        String pQuery = "DELETE FROM mascotas WHERE id = ?;";
        ps = connection.prepareStatement(pQuery);
        
        ps.setInt(1, id);
        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }

}
