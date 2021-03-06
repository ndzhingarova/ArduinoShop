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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author usager
 */
public class Confirmer extends HttpServlet {

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
        String prenom = request.getParameter("prenom");
        String nom = request.getParameter("nom");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String codePostal = request.getParameter("codePostal");
        String province = request.getParameter("province");
        String livraison = request.getParameter("livraison");
        HttpSession session = request.getSession();
        Utilisateur u = UtilisateurManager.getById((int)session.getAttribute("idUtilisateur"));
        u.setNom(nom);
        u.setPrenom(prenom);
        u.setTelephone(telephone);
        u.setAdresse(address);
        u.setVille(ville);
        u.setCodePostal(codePostal);
        u.setProvince(province);
        boolean me = UtilisateurManager.update(u);
        session.setAttribute("utilisateur", u);
        session.setAttribute("livraison", livraison);
//         PrintWriter out = response.getWriter();
//        if(me){
//            session.setAttribute("user", u);
//           
//            out.print(u.getNom());
//            out.print(u.getPrenom());
//            out.print(u.getTelephone());
//            out.print(u.getAdresse());
//            out.print(u.getVille());
//            out.print(u.getCodePostal());
//            out.print(u.getProvince());
//
//            
//        }else {
//            out.print("greshka");
//        }
        request.getRequestDispatcher("confirmer.jsp").forward(request, response);
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
