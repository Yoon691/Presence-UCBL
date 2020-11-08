<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>

<section>
    <h1>Liste des salles</h1>
    <table>
        <tr>
            <th>Nom</th>
            <th>Capacité</th>
            <th>Nb présents</th>
        </tr>
        <c:forEach items="${requestScope.salles.entrySet()}" var="salleEntry" varStatus="boucle">
            <tr>
                <td>${salleEntry.value.nom}</td>
                <td>
                    <form action="<c:url value="/admin"/>" method="post">
                        <input type="text" name="capacite" size="3" value="${salleEntry.value.capacite != -1 ? salleEntry.value.capacite : ''}"/>
                        <input type="hidden" name="contenu" value="salles">
                        <input type="hidden" name="nomSalle" value="${salleEntry.value.nom}">
                        <input type="submit" value="Modifier">
                    </form>
                </td>
                <td>${salleEntry.value.presents} présent(s)</td>
                <td>
                    <c:if test="${salleEntry.value.saturee}">
                        <strong style="color: red">Capacité dépassée</strong>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</section>