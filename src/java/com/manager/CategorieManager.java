/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.manager;

import com.entities.Categorie;
import com.service.ConnexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ddaar
 */
public class CategorieManager {
    private static String queryGetAll = "select * from categorie";
    private static String queryGetById = "select * from categorie where ID = ? ";
    
     public static ArrayList<Categorie> getAll() {
        ArrayList<Categorie> retour = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetAll);
            ResultSet result = ps.executeQuery();
            retour = new ArrayList<>();
            while (result.next()) {
                Categorie categorie = new Categorie(result.getInt("id"),result.getString("nom"),result.getString("description"));
                retour.add(categorie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally
        {
        ConnexionBD.closeConnection();
        return retour;
        }
    }

    public static Categorie getById(int id) {
        Categorie categorie = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetById);
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if(result.next()) {
                categorie = new Categorie(result.getInt("id"),result.getString("nom"),result.getString("description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally
        {
            ConnexionBD.closeConnection();
            return categorie;   
        }
    }
    
}
