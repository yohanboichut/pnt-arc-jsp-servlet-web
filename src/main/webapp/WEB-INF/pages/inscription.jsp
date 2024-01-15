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
    <title>QCM inscriptions</title>
</head>
<body>


<h1>QCM -- Inscription</h1>

<form action="/qcm/inscription" method="post">
    <label for="email">E-mail</label> <input  type="email" name="email" id="email">
    <br>
    <label for="pseudo">Pseudo</label> <input type="text" name="pseudo" id="pseudo">
    <fieldset>
        <legend>Sélectionne un type de compte :</legend>
        <div>
        <input type="radio" name="type" id="professeur" value="Professeur"><label for="professeur">Professeur</label>

            <input type="radio" name="type" id="etudiant" value="Etudiant"><label for="etudiant">Etudiant</label>
        </div>
    </fieldset>
    <input type="submit"/>
</form>

</body>
</html>
