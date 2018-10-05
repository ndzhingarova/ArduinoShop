/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.action.CommandeAction;
import com.action.LigneAction;
import com.entities.Commande;
import com.entities.Ligne;
import com.entities.LignePanier;
import com.entities.Utilisateur;
import com.manager.CommandeManager;
import com.manager.UtilisateurManager;
import com.outil.SendMailTLS;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author usager
 */
public class Envoyer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, LignePanier> articles = (HashMap<Integer, LignePanier>) session.getAttribute("panier");
        Utilisateur u = (Utilisateur) session.getAttribute("utilisateur");
        String livraison = (String) session.getAttribute("livraison");

        Commande c = new Commande();
        c.setIdUtilisateur(u.getId());
        Date date = new Date();
        java.sql.Date dateDB = new java.sql.Date(date.getTime());
        c.setDateObject(dateDB);
        c.setLivraison(livraison);
        int idbase = CommandeAction.creeCommande(c);
        Collection<LignePanier> les = articles.values();
        if(les!=null){

        boolean enregistre = false;
        for(LignePanier l : les){
            Ligne ligneBD = new Ligne(idbase, l.getProduit().getId(),l.getQuantite());
            enregistre = LigneAction.creeLigne(ligneBD);
        }
        String subject = "Votre commande a été effectue" ;
        String body = "Cher client,"
                + "\n Merci pour votre commande. Notre /quipe vont vous contacter dans 24 heures pour le confirmer";
//        try (PrintWriter out = response.getWriter()) {
//            out.println(articles.size());
//            out.println(u.getCourriel());
//            out.println(idbase);
//        }
        boolean envoye = SendMailTLS.sendMail(u.getCourriel(), subject, body);
        String messageResultat = "";
        if(enregistre){
            session.setAttribute("panier", null);
            messageResultat = "Merci, pour votre commande.";
        } else {
            messageResultat = "Votre commande n'était pas enregistrer. S'il vous plaît essaier plus tard";
        }
        request.setAttribute("message", messageResultat);
                    
        }
        request.getRequestDispatcher("panier").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
