<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.User" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<header class="wrapper">
    <div class="header-titre"><strong>Pr�sence UCBL</strong></div>
    <c:if test="${sessionScope.user != null}">
        <div class="header-user"><a href="${sessionScope.user.admin ? './admin?contenu=user&login='.concat(sessionScope.user.login) : './presence?contenu=user&login='.concat(sessionScope.user.login)}"><%= ((User) (session.getAttribute("user"))).getLogin() %></a></div>
    </c:if>
</header>