package com.service;

import com.entities.Produit;

import com.manager.ProduitsManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TestBDRequeteSelectAll {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
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
