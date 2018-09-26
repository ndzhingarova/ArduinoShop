/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.entities.Produit;
import com.manager.ProduitsManager;
import java.util.ArrayList;

/**
 *
 * @author nikoletad
 */
public class ProduitAction {

    public static ArrayList<Produit> afficherProduits() {
        ArrayList<Produit> produits = ProduitsManager.getAll();
        return produits;
    }
}
