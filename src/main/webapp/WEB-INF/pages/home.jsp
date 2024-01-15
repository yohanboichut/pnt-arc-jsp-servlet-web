<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yoh
  Date: 15/01/2024
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:useBean id="erreur" class="java.lang.String"/>
    <title>Connexion</title>
</head>
<body>


<h1>QCM -- Connexion</h1>

<c:if test="${!empty erreur}">
    <span style="color: red; ">${erreur}</span>
</c:if>

<form action="/qcm/connexion" method="post">
    <label for="email">E-mail</label> <input  type="email" name="email" id="email">
    <br>
    <label for="cleAuthentification">Mot de passe</label> <input type="password" name="cleAuthentification" id="cleAuthentification">
    <input type="submit"/>
</form>


<br>

<a href="/qcm/gotoinscription">S'inscrire</a>

</body>
</html>
