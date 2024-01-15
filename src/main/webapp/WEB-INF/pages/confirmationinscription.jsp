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
    <title>Confirmation inscription</title>

    <jsp:useBean id="cleAuthentification" beanName="cleAuthentification" type="java.lang.String" scope="request"/>
</head>
<body>

<h1>Confirmation</h1>


<div>
    Félicitations, vous venez de réussir à vous inscrire. Votre clé d'authentification est :
    <b>${cleAuthentification}</b> !
</div>

<a href="/qcm/home">Se connecter</a>

</body>
</html>
