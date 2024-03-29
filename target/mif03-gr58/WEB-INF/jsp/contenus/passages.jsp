<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>

<section>
    <c:if test="${requestScope.salles.saturee}">
        <h2><span style="color: red">Alerte : capacite de la salle ${param.nom} d�pass�e</span></h2>
    </c:if>
    <h1>
        Liste des passages
        <c:if test="${param.login != null}">
            pour l'utilisateur ${param.login}
        </c:if>
        <c:if test="${param.nomSalle != null}">
            dans la salle ${param.nomSalle}
        </c:if>
        <c:if test="${param.dateSortie != null}">
            <%
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", new Locale("us"));
                    Date dateEntree = sdf.parse(request.getParameter("dateEntree"));
                    Date dateSortie = sdf.parse(request.getParameter("dateSortie"));
            %>
            entre
            <fmt:formatDate value="<%= dateEntree %>" var="dateEntree" type="time"/>
            ${dateEntree}
            et
            <fmt:formatDate value="<%= dateSortie %>" var="dateSortie" type="time"/>
            ${dateSortie}
            <%
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            %>
        </c:if>
    </h1>

    <table>
        <tr>
            <th>Login</th>
            <th>Salle</th>
            <th>Entr�e</th>
            <th>Sortie</th>
        </tr>
        <c:forEach items="${requestScope.passagesAffiches}" var="passage">
            <tr>
                <td>
                    <a href="<%= request.getServletPath().substring(1)%>?contenu=passages&login=${passage.user.login}">${passage.user.login}</a>
                </td>
                <td>
                    <a href="<%= request.getServletPath().substring(1)%>?contenu=passages&nomSalle=${passage.salle.nom}">${passage.salle.nom}</a>
                </td>
                <td>
                    <fmt:formatDate value="${passage.entree}" var="heureEntree" type="time"/>
                        ${heureEntree}
                </td>
                <td>
                    <fmt:formatDate value="${passage.sortie}" var="heureSortie" type="time"/>
                        ${heureSortie}
                </td>
                <c:if test="${passage.sortie != null && sessionScope.user.admin}">
                    <td>
                        <a href="../interface_admin.jsp?contenu=passages&nomSalle=${passage.salle.nom}&dateEntree=${passage.entree}&dateSortie=${passage.sortie}">tous
                            les pr�sents</a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</section>