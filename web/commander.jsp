<%-- 
    Document   : produits
    Created on : 26-Sep-2018, 1:21:12 AM
    Author     : nikoletad
--%>

<%@page import="com.entities.Utilisateur"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.LignePanier"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HashMap<Integer, LignePanier> articles = (HashMap<Integer, LignePanier>) session.getAttribute("panier");
    Utilisateur u = (Utilisateur) session.getAttribute("utilisateur");
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
                <script type="text/javascript" src="./javascript/form_validation.js"></script>
        <div class="container-fluid col-6">
            <form action="confirmer">
                <div class="form-group">
                    <label for="exampleFormControlInput1">Prénom</label>
                    <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Votre prénom" value="<%=u.getPrenom()%>" onkeyup="validateNames('prenom','prenomFeedback')" required>
                    <div id="prenomFeedback"></div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Nom</label>
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Votre nom" value="<%=u.getNom()%>" onkeyup="validateNames('nom','nomFeedback')" required>
                    <div id="nomFeedback"></div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Téléphone</label>
                    <input type="text" class="form-control" id="telephone" name="telephone" placeholder="Votre téléphone" value="<%=u.getTelephone()%>" onkeyup="validatePhone('telephone','telephoneFeedback')" required>
                    <div id="telephoneFeedback"></div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Address</label>
                    <input type="text" class="form-control" name="adresse" placeholder="Votre address" value="<%=u.getAdresse()%>" required>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Ville</label>
                    <input type="text" class="form-control" id="ville" name="ville" placeholder="Votre ville" value="<%=u.getVille()%>" onkeyup="validateNames('ville','villeFeedback')" required>
                    <div id="villeFeedback"></div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Code Postal</label>
                    <input type="text" class="form-control" id="codePostal" name="codePostal" placeholder="Votre code postal" value="<%=u.getCodePostal()%>" onkeyup="validatePostalCode('codePostal','codePostalValidation')" required>
                    <div id="codePostalValidation"></div>
                </div>
                <div class="form-group">
                    <label for="inputState">Province</label>
                    <select id="province" name="province" class="form-control" required>
                        <option selected>Votre province</option>
                        <option value="Alberta">Alberta</option>
                        <option value="Colombie-Britannique">Colombie-Britannique</option>
                        <option value="Île-du-Prince-Édouard">Île-du-Prince-Édouard</option>
                        <option value="Manitoba">Manitoba</option>
                        <option value="Nouveau-Brunswick">Nouveau-Brunswick</option>
                        <option value="Nouvelle-Écosse">Nouvelle-Écosse</option>
                        <option value="Ontario">Ontario</option>
                        <option value="Québec">Québec</option>
                        <option value="Saskatchewan">Saskatchewan</option>
                        <option value="Terre-Neuve-et-Labrador">Terre-Neuve-et-Labrador</option>
                        <option value="Nunavut">Nunavut</option>
                        <option value="Territoires-du-Nord-Ouest">Territoires-du-Nord-Ouest</option>
                        <option value="Yukon">Yukon</option>
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
                    <input class="form-check-input" type="radio" name="livraison" id="express" value="express">
                    <label class="form-check-label" for="express">
                        Livraison express - 3 jours ouvrables
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Confirmer la commande</button></br>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
