<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>

<section id="contenu">
    <p><strong>Hello ${sessionScope.user.nom} !</strong></p>
    <c:if test="${requestScope.passagesAffiches.size() > 0}">
        <p>Vous �tes actuellement dans les salles :</p>
        <ul>
            <c:forEach var="p" items="${requestScope.passagesAffiches}">
                <li>
                        ${p.salle.nom}
                    <c:if test="${p.salle.saturee}">
                        <strong style="color: red">Alerte : cette salle est satur�e !</strong>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <p>Choisissez une option dans le menu.</p>
</section>
