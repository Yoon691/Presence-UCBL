<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.Passage" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.Salle" %>
<%@ page import="java.util.Date" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.User" %>
<%@ page import="java.util.List" %>

<%--Definition de la javaBean de Type GestionPassages--%>
<jsp:useBean id="passages" class="fr.univlyon1.m1if.m1if03.classes.GestionPassages"
             scope="application">

</jsp:useBean>



<% if (request.getMethod().equals("GET")) { //redirection des utilisateurs non connectés à la page d'accueil

    User user = (User) request.getSession().getAttribute("user");

    if (user == null) {
        response.sendRedirect("index.html");
        return;
    }


}
%>

<% if (request.getMethod().equals("POST")) { // Traitement du formulaire envoyé par saisie.html

    if(request.getParameter("entree") != null) {
        passages.add(new Passage(
                (User) session.getAttribute("user"),
                new Salle(request.getParameter("nom")),
                new Date())
        );
    } else if(request.getParameter("sortie") != null) {
        List<Passage> passTemp = passages.getPassagesByUserAndSalle(
                (User) session.getAttribute("user"),
                new Salle(request.getParameter("nom"))
        );
        if(!passTemp.isEmpty()) {
            Passage p = passTemp.get(0);
            p.setSortie(new Date());
        }
    }

    String action = request.getParameter("action");

} %>


<% List<Passage> passagesAffiches = null; %>

<c:if test="${sessionScope.admin}">
    <h2>Liste de tous les passages</h2>
    <% passagesAffiches = passages.getAllPassages(); %>
</c:if>

<table>
<tr>
    <th>Login</th>
    <th>Salle</th>
    <th>Entrée</th>
    <th>Sortie</th>
</tr>

<c:forEach items="<%= passagesAffiches %>" var="passage">
    <tr>
        <td>${passage.user.login}</td>
        <td>${passage.salle.nom}</td>
        <td>
            <fmt:formatDate value="${passage.entree}" var="heureEntree" type="time" />
                ${heureEntree}
        </td>
        <td>
            <fmt:formatDate value="${passage.sortie}" var="heureSortie" type="time" />
                ${heureSortie}
        </td>
    </tr>
</c:forEach>