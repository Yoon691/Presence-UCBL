<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>

<c:set var="user" value="${requestScope.users[param.login]}"/>

<section>
<%--<c:forEach items="${requestScope.users.entrySet()}" var="user" >--%>
    <h1>User ${user.login}</h1>

    <c:if test="${user.login == null}">
        <h1>Utilisateur ${user.login} non trouvé</h1>
    </c:if>

    <c:if test="${user.login != null}">
        <ul>
            <li>Login : ${user.login}</li>
            <li>Nom : ${user.nom}</li>
            <li>admin : ${user.admin == true ? "oui" : "non"}</li>
        </ul>
    </c:if>
<%--</c:forEach>--%>
</section>
