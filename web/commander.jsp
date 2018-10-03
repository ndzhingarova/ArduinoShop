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
        <div class="container-fluid col-6">
            <form action="confirmer">
                <div class="form-group">
                    <label for="exampleFormControlInput1">Prénom</label>
                    <input type="text" class="form-control" name="prenom" placeholder="Votre prénom">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Nom</label>
                    <input type="text" class="form-control" name="nom" placeholder="Votre nom">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Téléphone</label>
                    <input type="text" class="form-control" name="telephone" placeholder="Votre téléphone">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Address</label>
                    <input type="text" class="form-control" name="adresse" placeholder="Votre address">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Ville</label>
                    <input type="text" class="form-control" name="ville" placeholder="Votre ville">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Code Postal</label>
                    <input type="text" class="form-control" name="codePostal" placeholder="Votre code postal">
                </div>
                <div class="form-group">
                    <label for="inputState">Province</label>
                    <select id="province" name="province" class="form-control">
                        <option selected>Votre province</option>
                        <option>Alberta</option>
                        <option>Colombie Britannique</option>
                        <option>Île-du-Prince-Édouard</option>
                        <option>Manitoba</option>
                        <option>Nouveau-Brunswick</option>
                        <option>Nouvelle-Écosse</option>
                        <option>Ontario</option>
                        <option>Québec</option>
                        <option>Saskatchewan</option>
                        <option>Terre-Neuve-et-Labrador</option>
                        <option>Nunavut</option>
                        <option>Territoires du Nord-Ouest</option>
                        <option>Yukon</option>
                    </select>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="livraison" id="gratuit" value="gratuit" checked>
                    <label class="form-check-label" for="gratuit">
                        Livraison gratuit - 8 à 9 jours ouvrables
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="livraison" id="standard" value="standard">
                    <label class="form-check-label" for="standard">
                        Livraison standard - 4 à 5 jours ouvrables
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="livraison" id="express" value="express" disabled>
                    <label class="form-check-label" for="express">
                        Livraison express - 3 jours ouvrables
                    </label>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Confirmer la commande    </button></br>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
