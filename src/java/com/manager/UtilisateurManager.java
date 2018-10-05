/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.manager;

import com.entities.Utilisateur;
import com.service.ConnexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ddaar
 */
public class UtilisateurManager {
    private static String queryGetAll = "select * from utilisateur";
    private static String queryGetById = "select * from utilisateur where ID = ? ";
    private static String queryGetByCourriel = "select * from utilisateur where COURRIEL = ? ";
    
    public static ArrayList<Utilisateur> getAll() {
        ArrayList<Utilisateur> retour = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetAll);
            ResultSet result = ps.executeQuery();
            retour = new ArrayList<>();
            while (result.next()) {
                Utilisateur utilissateur = new Utilisateur(result.getInt("id"), result.getString("courriel"),result.getString("motdepasse"));
                retour.add(utilissateur);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
        ConnexionBD.closeConnection();
        return retour;
        }
    }

    public static Utilisateur getById(int id) {
        Utilisateur utilisateur = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetById);
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if(result.next()) {
                utilisateur = new Utilisateur(result.getInt("id"), result.getString("courriel"),result.getString("motdepasse"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
        ConnexionBD.closeConnection();
        return utilisateur;   
        }
    }
    
    public static Utilisateur getByCourriel(String courriel) {
        Utilisateur utilisateur = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetByCourriel);
            ps.setString(1, courriel);
            ResultSet result = ps.executeQuery();
            if(result.next()) {
                utilisateur = new Utilisateur(result.getInt("id"), result.getString("courriel"),result.getString("motdepasse"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally{
        ConnexionBD.closeConnection();
        return utilisateur;   
        }
    }

}
