/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author usager
 */
public class Commande {
    private int id;
    private int idUtilisateur;
    private String date;
    private Date dateObject;
    private String livraison;

    public Commande() {
    }

    public Commande(int id, int idUtilisateur, String date, Date dateObject, String livraison) {
        this.id = id;
        this.idUtilisateur = idUtilisateur;
        this.date = date;
        this.dateObject = dateObject;
        this.livraison = livraison;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Date getDateObject() {
        return dateObject;
    }

    public void setDateObject(Date dateObject) {
        this.dateObject = dateObject;
    }

    public String getLivraison() {
        return livraison;
    }

    public void setLivraison(String livraison) {
        this.livraison = livraison;
    }
    
    
    
    
}
