<%--
  Created by IntelliJ IDEA.
  User: barry
  Date: 24/10/2020
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.User" %>

<%--Definition de la javaBean de Type GestionPassages--%>
<jsp:useBean id="passages" class="fr.univlyon1.m1if.m1if03.classes.GestionPassages"
             scope="application">
</jsp:useBean>

<c:if test="${!sessionScope.admin}">
    <% response.sendRedirect("interface.jsp");%>
</c:if>

<!doctype html>
<html>
<head>
    <title>Presence</title>
</head>
<body>
<h2>Hello <%= ((User) (session.getAttribute("user"))).getLogin() %> !</h2>

<c:set var="action_value" value="${param.action}"></c:set>
<div>
    <h3>Menu</h3>
    <ul>
        <li><a href="interface_admin.jsp?action=passage">Tous les passages</a></li>
        <li><a href="interface_admin.jsp?action=lesSalles">Toutes les salles</a></li>
        <li><a href="recherche_user.html">Info sur un utlisateur</a></li>
        <li><a href="saisie.html">Nouveau passage</a></li>
        <li><a href="Deco">Se déconnecter</a></li>
    </ul>
</div>
<c:choose>
    <c:when test="${ action_value == 'passage'}">
        <jsp:include page="passages_admin.jsp"></jsp:include>
    </c:when>
    <c:when test="${ action_value == 'lesSalles'}">
        <jsp:include page="salles.jsp"></jsp:include>
    </c:when>
    <c:when test="${ action_value == 'recherche_user'}">
        <jsp:include page="user.jsp"></jsp:include>
    </c:when>
</c:choose>
</body>
</html>
