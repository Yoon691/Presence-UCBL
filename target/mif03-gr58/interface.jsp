<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page errorPage="erreurs/error.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <title>Présence UCBL</title>
    <link rel="stylesheet" type="text/css" href="static/presence.css">
</head>
<body>
<jsp:include page="composants/header.jsp"/>

<main class="wrapper">
    <jsp:include page="composants/menu.jsp"/>
    <article class="contenu">
        <c:choose>
            <c:when test="${param.contenu == null}">
                <jsp:include page="contenus/default.jsp"/>
            </c:when>
            <c:when test="${param.contenu == \"passages\"}">
               <jsp:include page="contenus/passages.jsp"/>
            </c:when>
            <c:when test="${param.contenu == \"user\"}">
                <jsp:include page="contenus/user.jsp?login=${sessionScope.user.login}"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="contenus/${param.contenu}.jsp"/>
            </c:otherwise>
        </c:choose>
    </article>
</main>

<jsp:include page="composants/footer.html"/>
</body>
</html>
