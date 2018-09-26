/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.entities.Produit;
import com.manager.ProduitsManager;
import java.sql.Connection;
import java.util.ArrayList;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author nikoletad
 */
public class ConnexionBDTest {

    public ConnexionBDTest() {
    }

    @Test
    public void testGetConnection() {
//        System.out.println("getConnection");
//        Connection expResult = null;
//        Connection result = ConnexionBD.getConnection();
//        assertEquals(expResult, result);
        ArrayList<Produit> retour = ProduitsManager.getAll();
        for (Produit rod : retour) {
            System.out.println("ID : " + rod.getId());
            System.out.println("Nom : " + rod.getNom());
            System.out.println("Prix : " + rod.getPrix());
            System.out.println("Description : " + rod.getDescription());
            System.out.println("Image : " + rod.getImage());
            System.out.println(" categorie : " + rod.getCategorie());

        }
    }

}
