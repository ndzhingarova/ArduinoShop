<%-- 
    Document   : connexion
    Created on : 26-Sep-2018, 12:57:22 AM
    Author     : nikoletad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.controller.Connexion"%>
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
            <div class="row">
                <div container>
                    <h1 >Connexion </h1>
                    <form class="form-signin" action="connexion" method="get">
                        <input type="text" class="form-control" id="email" name="courriel" placeholder="Courriel" onkeyup="validateEmail('email','emailFeedback')" required autofocus>
                        <div id="emailFeedback"></div>
                        <% if(session.getAttribute("userNotFound") != null){ %> 
                        <div class='alert alert-danger'> <%= session.getAttribute("userNotFound") %> </div> <% } %></br>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                        <% if(session.getAttribute("wrongPassword") != null){ %>
                        <div class='alert alert-danger'> <%= session.getAttribute("wrongPassword") %><% } %> </div></br>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button></br>
                        <label class="checkbox pull-left">
                            <input type="checkbox" name="sauvegarde" value="yes">Remember me </br>
                        </label>
                    </form>
                </div>
            </div>
        </div>
    <script src="./javascript/form_validation.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>
</html>
