/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.entities.Ligne;
import com.manager.LigneManager;

/**
 *
 * @author usager
 */
public class LigneAction {
        public static boolean creeLigne(Ligne l) {
        boolean b = LigneManager.insertLigne(l);
        return b;
    }
}
