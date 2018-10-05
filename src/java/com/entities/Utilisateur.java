/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

/**
 *
 * @author ddaar
 */
public class Utilisateur {
    
    private Integer id;
    private String courriel;
    private String motDePasse;
 
    public Utilisateur(Integer id, String courriel, String motDePasse) {
        this.id = id;
        this.courriel = courriel;
        this.motDePasse = motDePasse;
    }
        
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourriel() {
        return courriel;
    }

    public void setCourriel(String courriel) {
        this.courriel = courriel;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }
    
    public boolean validatePassword(String motDePasse)
    {
        //object has been initialized and object has an id, so it is coming from the database
        if(this.courriel != null && this.id != null)
        {
            if(this.motDePasse.equals(motDePasse))
            {
                return true;
            }
        }
        return false;
    }
}
