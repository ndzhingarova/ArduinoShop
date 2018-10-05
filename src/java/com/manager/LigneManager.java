/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.manager;

import com.entities.Ligne;
import com.service.ConnexionBD;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author usager
 */
public class LigneManager {
    private static String queryInsert = "insert into ligne(id_commande, id_produit, quantite) value(?,?,?)";

    public static boolean insertLigne(Ligne l) {;
        PreparedStatement ps;
        int nbLigne = 0;
        try {
            ps = ConnexionBD.getConnection().prepareStatement(queryInsert);
            ps.setInt(1, l.getIdCommande());
            ps.setInt(2, l.getIdProduit());
            ps.setInt(3, l.getQuantite());

            nbLigne = ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ConnexionBD.closeConnection();
        return nbLigne > 0;
    }
}
