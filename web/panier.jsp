<%-- 
    Document   : produits
    Created on : 26-Sep-2018, 1:21:12 AM
    Author     : nikoletad
--%>

<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.LignePanier"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HashMap<Integer, LignePanier> articles = (HashMap<Integer, LignePanier>) session.getAttribute("panier");
    double somme = 0;
    int quant = 0;
    String message = (String) session.getAttribute("message");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>ArduinoStore</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page = "navbar.jsp" flush = "true" />
        <div class="container">
            <h2>Votre panier</h2>  
            <form action="commander">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Commander</button></br>
            </form>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Produit</th>
                        <th>Prix Unitaire</th>
                        <th>Somme</th>
                        <th>Quantite</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (articles != null) {
                            Collection<LignePanier> les = articles.values();
                            if (les.isEmpty()) {                             
                %>
                <tr><td>Votre panier est vide</td></tr>
                <%          } else {
                                for (LignePanier l : les) {

                                    somme += l.getProduit().getPrix() * l.getQuantite();
                                    quant += l.getQuantite();
                %>  
                <tr>
                    <td>
                        <img alt="prod image" src="images/<%=l.getProduit().getImage()%>" height="100" width="100"/> 
                    </td>
                    <td> <%=l.getProduit().getNom()%> </td>
                    <td> <%=l.getProduit().getPrix()%> CAD </td>
                    <td> <%=l.getProduit().getPrix() * l.getQuantite()%> CAD </td>
                    <td> 
                        <form action="modifierProduit">
                            <input type="text" name="produit" value="<%=l.getProduit().getId()%>" hidden>
                            <input type="text" name="quantite" value="<%=l.getQuantite()%>" size="3">
                            <input type="submit" value="Modifier Quantité" >
                            <input type="submit" name="retirer" value="Retirer Produit" > 
                        </form>
                    </td>                
                </tr>
                <%              }
                            }
                        } else {%>
<tr><td>Votre panier est vide</td></tr>
<%}%>
                </tbody>
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th><%=somme%> CAD</th>
                        <th><%=quant%></th>
                    </tr>
                </thead>
            </table>
            <form action="commander">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Commander</button></br>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
