<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>

<section>
    <h1>User ${param.login}</h1>

    <c:if test="${requestScope.passagesAffiches.contains(sessionScope.user)}">
        <h1>Utilisateur ${param.login} non trouvé</h1>
    </c:if>

    <c:if test="${!requestScope.passagesAffiches.contains(sessionScope.user)}">
        <ul>
            <li>Login : ${sessionScope.user.login}</li>
            <li>Nom : ${sessionScope.user.nom}</li>
            <li>admin : ${sessionScope.user.admin == true ? "oui" : "non"}</li>
        </ul>
    </c:if>
</section>