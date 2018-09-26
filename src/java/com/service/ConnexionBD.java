/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author nikoletad
 */
public class ConnexionBD {

    private static String url = "jdbc:mysql://127.0.0.1:3306/arduino";
    private static String user = "root";
    private static String pwd = "root";
    private static Connection conn = null;

    public static Connection getConnection() {
		try {
                    //chargement du driver
			Class.forName("com.mysql.jdbc.Driver");
	//DriverManager est responsable de la sélection de la BD et
        //la création de la connexion
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return conn;
    }

    public static void closeConnection() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
