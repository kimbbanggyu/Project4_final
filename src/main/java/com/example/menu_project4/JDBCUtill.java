package com.example.menu_project4;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtill {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/p232_22000124","p232_22000124","ShuZ0i");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

//    public static void main(String ars[]){
//        Connection conn = getConnection();
//        if(conn != null)
//            System.out.println("DB 연결됨!");
//        else System.out.println("DB 연결중 오류!");
//    }
}
