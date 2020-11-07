<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<aside class="menu">
    <p><strong>Menu</strong></p>
    <p>
        <a href="<c:url value="/presence"/>">Accueil</a><br>
        <a href="<c:url value="/presence?contenu=saisie_passage"/>">Nouveau passage</a><br>
        <a href="<c:url value="/presence?contenu=passages"/>">Mes passages</a>
    </p>
    <p>
        <em><a href="interface_admin.jsp">Interface d'administration</a></em><br>
    </p>
    <p>
        <a href="Deco">Déconnexion</a>
    </p>
</aside>