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
<% HashMap<Integer, LignePanier> articles = (HashMap<Integer, LignePanier>) session.getAttribute("panier");%>
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
        <div class="container-fluid col-8">
            <h1>affichage de panier </h1>
            <% if (articles != null) {
                    Collection<LignePanier> les = articles.values();
                    if (les.isEmpty()) {%>
            <p>Votre panier est vide</p>
            <%} else {
                for (LignePanier l : les) {
            %>  
            <div class="row">
                <div class="col-2">
                    <img src="images/<%=l.getProduit().getImage()%>" alt="Card image cap" height="100" width="100">
                </div>
                <div class="col-4">
                    <h5><%=l.getProduit().getNom()%></h5>

                </div>
                <div class="col-2">
                    <p><small class="text-muted"><%=l.getProduit().getPrix()%> CAD</small></p>
                </div>
                <div class="col-2">
                    <form action="modifierProduit">
                        <input type="text" name="produit" value="<%=l.getProduit().getId()%>" hidden>
                        <input type="number" name="quantite" value="<%=l.getQuantite()%>" maxlength="3" size="3">
                        <input type="submit" value="Modifier Quantité" >
                        <input type="submit" name="retirer" value="Retirer Produit" >
                    </form>
                </div>
                <div class="col-2">
                    <p><small class="text-muted"><%=l.getProduit().getPrix() * l.getQuantite()%> CAD</small></p>
                </div>

            </div>
            <%          }
                    }
                }%>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
