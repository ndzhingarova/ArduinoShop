/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.manager;

import com.entities.Produit;
import java.sql.PreparedStatement;
import com.service.ConnexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author nikoletad
 */
public class ProduitsManager {

    private static String queryGetAll = "select * from produit";
    private static String queryGetById = "select * from produit where ID = ? ";
    private static String queryGetByCategory = "select * from produit where CATEGORIE = ? ";

    public static ArrayList<Produit> getAll() {
        ArrayList<Produit> retour = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetAll);
            ResultSet result = ps.executeQuery();
            retour = new ArrayList<>();
            while (result.next()) {
                Produit prod = new Produit();
                prod.setId(result.getInt("id"));
                prod.setNom(result.getString("nom"));
                prod.setPrix(result.getDouble("prix"));
                prod.setDescription(result.getString("description"));
                prod.setCategorie(result.getString("categorie"));
                prod.setImage(result.getString("image"));
                retour.add(prod);
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

    public static Produit getById(int id) {
        Produit prod = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetById);
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();
            if(result.next()) {
                prod = new Produit();
                prod.setId(result.getInt("id"));
                prod.setNom(result.getString("nom"));
                prod.setPrix(result.getDouble("prix"));
                prod.setDescription(result.getString("description"));
                prod.setCategorie(result.getString("categorie"));
                prod.setImage(result.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally
        {
            ConnexionBD.closeConnection();
            return prod;   
        }
    }
    
        public static ArrayList<Produit> getByCategory(int categorie) {
        ArrayList<Produit> retour = null;
        try {
            PreparedStatement ps = ConnexionBD.getConnection().prepareStatement(queryGetByCategory);
            ps.setInt(1, categorie);
            
            ResultSet result = ps.executeQuery();
            retour = new ArrayList<>();
            while (result.next()) {
                Produit prod = new Produit();
                prod.setId(result.getInt("id"));
                prod.setNom(result.getString("nom"));
                prod.setPrix(result.getDouble("prix"));
                prod.setDescription(result.getString("description"));
                prod.setCategorie(result.getString("categorie"));
                prod.setImage(result.getString("image"));
                retour.add(prod);
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

}
