/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.entities.Commande;
import com.manager.CommandeManager;

/**
 *
 * @author usager
 */
public class CommandeAction {
    
    public static int creeCommande(Commande c) {
        int id = CommandeManager.insertCommande(c);
        return id;
    }
}
