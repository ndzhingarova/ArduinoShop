/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.entities.Utilisateur;
import com.manager.UtilisateurManager;

/**
 *
 * @author usager
 */
public class UtilisateurAction {
    
    public static boolean miseAJourAdresseUtilisateur(Utilisateur u) {
        return UtilisateurManager.update(u);
    }
    
    public static Utilisateur trouverUtilisateur(int id) {
        Utilisateur u = UtilisateurManager.getById(id);
        return u;
    }
}
