/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entities.Utilisateur;
import com.manager.UtilisateurManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nikoletad
 */
public class Connexion extends HttpServlet
{

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
  
        String courriel = request.getParameter("courriel");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        // athetification apres une bd
        Utilisateur utilisateurAValider = UtilisateurManager.getByCourriel(courriel);
        
        if (utilisateurAValider == null)//AUCUN UTILISATEUR TROUVER
        {
            session.setAttribute("userNotFound",courriel + "Ce courriel est invalide");
            request.getRequestDispatcher("connexion.jsp").forward(request, response);
        } 
        else
        {
            if(utilisateurAValider.validatePassword(password))//MOTE DE PASSE VALIDE
            {
                                //Ajouter le nom a la session
                session.setAttribute("nom", utilisateurAValider.getCourriel());

                String cookies = request.getParameter("sauvegarde");
                if(cookies!=null || true)
                {
                    //creation
                    Cookie nomUtilisateur = new Cookie("utilisateur", utilisateurAValider.getCourriel());
                    Cookie pwdutilisateur = new Cookie("pwd", utilisateurAValider.getMotDePasse());
                    nomUtilisateur.setMaxAge(60 * 60 * 24);
                    pwdutilisateur.setMaxAge(60 * 60 * 24);
                    response.addCookie(nomUtilisateur);
                    response.addCookie(pwdutilisateur);
                    
                    if(session.getAttribute("wrongPassword") != null)
                    {
                        session.removeAttribute("wrongPassword");
                    }
                    if(session.getAttribute("userNotFound") != null)
                    {
                        session.removeAttribute("userNotFound");
                    }
                }
                request.getRequestDispatcher("produits").forward(request, response);
            }
            else//MOT DE PASSE NON-VALIDE
            {
               Cookie nomUtilisateur = new Cookie("nom", utilisateurAValider.getCourriel());
                if(session.getAttribute("userNotFound") != null)
                {
                    session.removeAttribute("userNotFound");
                }
               response.addCookie(nomUtilisateur);
               session.setAttribute("wrongPassword",utilisateurAValider.getCourriel() + "Ce mot de passe est invalide");
            request.getRequestDispatcher("connexion.jsp").forward(request, response);
            }
        }
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
