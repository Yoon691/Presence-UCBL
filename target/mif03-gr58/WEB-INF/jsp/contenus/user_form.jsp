<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<section>
    <h1>Affichage d'un utilisateur</h1>

    <form method="get" action="<c:url value="/admin"/>">
        <label>
            Login de l'utilisateur cherché :
            <input type="text" name="login" autofocus>
        </label>
        <input type="hidden" name="contenu" value="user">
        <input type="submit" value="Envoyer">
    </form>
</section>