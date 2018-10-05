<%-- 
    Document   : produits
    Created on : 26-Sep-2018, 1:21:12 AM
    Author     : nikoletad
--%>

<%@page import="com.controller.Produits"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Produit"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Produit> listeproduits = Produits.mes;//(ArrayList) request.getAttribute(Produits.CLE_DONNEE);
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
        <h1>affichage des produits </h1>        
        <table style="width:70%">
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Prix</th>
                <th>Description</th>
                <th>Categorie</th>
                <th>Image</th>
            </tr>
            <form action="addProduit">
                <%
                    if (listeproduits != null) {
                        for (Produit prod : listeproduits) {
                %>
                <tr>
                    <td>
                        <img alt="prod image" src="images/<%=prod.getImage()%>" height="150" width="150"/> 
                    </td> 

                    <td> <%=prod.getNom()%> </td>
                    <td> <%=prod.getPrix()%> </td>
                    <td> <%=prod.getDescription()%> </td>
                    <td> <%=prod.getCategorie()%> </td>
                    <td> <input type="submit" name="add" value="<%=prod.getId()%>" text="Add to Cart" </td>                
                </tr>




                <%
                        }
                    }
                %>
            </form>
        </table       
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
