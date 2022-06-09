/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package AppCafe;

/**
 * 
 * @author Andika Risky Septiawan
 */
import java.sql.*;
import javax.swing.JOptionPane;

public class Koneksi {
    Connection conn;
    Statement stm;
    
    public void config() {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            String url = "jdbc:mysql://localhost/cafe_bisa_ngopi";
            String user = "root";
            String pass = "";
            conn = DriverManager.getConnection(url, user, pass);
            stm = conn.createStatement();
        } catch(Exception e) {
            JOptionPane.showMessageDialog(null, "koneksi gagal " + e.getMessage());
            System.exit(0);
        }
    }
}
