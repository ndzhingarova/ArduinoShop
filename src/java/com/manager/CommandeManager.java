/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.manager;

import com.entities.Commande;
import com.service.ConnexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author usager
 */
public class CommandeManager {

    private static String queryInsert = "insert into commande(id_utilisateur, date, livraison) value(?,?,?)";

    public static int insertCommande(Commande c) {

        int idRetour = 0;
        PreparedStatement ps;
        int nbLigne = 0;
        try {
            ps = ConnexionBD.getConnection().prepareStatement(queryInsert, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, c.getIdUtilisateur());
            ps.setDate(2, c.getDateObject());
            ps.setString(3, c.getLivraison());

            nbLigne = ps.executeUpdate();
            if (nbLigne == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    idRetour = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ConnexionBD.closeConnection();
        return idRetour;
    }
}
