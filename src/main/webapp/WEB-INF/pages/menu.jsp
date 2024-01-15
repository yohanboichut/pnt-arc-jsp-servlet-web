<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yoh
  Date: 15/01/2024
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <ul>
    <jsp:useBean id="utilisateur" beanName="utilisateur" type="modele.Utilisateur" scope="session"/>
</head>
<body>

<c:if test="${utilisateur.typeUtilisateur == 'PROFESSEUR'}">
    Professeur
</c:if>

<c:if test="${utilisateur.typeUtilisateur == 'ETUDIANT'}">
    Etudiant
</c:if>

    <li> <a href="/qcm/deconnexion">Se déconnecter</a></li>
</ul>

</body>
</html>
