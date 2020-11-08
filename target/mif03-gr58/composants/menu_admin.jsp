<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<aside class="menu">
    <p><strong>Menu</strong></p>
    <p>Voir les passages</p>
    <p>
        <a href="<c:url value="/admin?contenu=user_passage_form"/>">Par utilisateur</a><br>
        <a href="<c:url value="/admin?contenu=salle_passage_form"/>">Par salle</a><br>
        <a href="<c:url value="/admin?contenu=passages"/>">Tous</a>
    </p>
    <p>Autres ressources</p>
    <p>
        <a href="<c:url value="/admin?contenu=salles"/>">Salles</a><br>
        <a href="<c:url value="/admin?contenu=user_form"/>">Utilisateur</a>
    </p>
    <p>
        <em><a href="<c:url value="/presence"/>">Interface classique</a></em>
    </p>
    <p><a href="Deco">Déconnexion</a></p>
</aside>