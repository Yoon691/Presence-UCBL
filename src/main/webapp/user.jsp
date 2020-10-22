<%--
  Created by IntelliJ IDEA.
  User: barry
  Date: 20/10/2020
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.Passage" %>

<jsp:useBean id="passages" class="fr.univlyon1.m1if.m1if03.classes.GestionPassages"
             scope="application">
</jsp:useBean>

<%List<Passage>passageList;%>

<html>
<head>
    <title>User</title>
</head>
<body>
    <h2>Informations Utilisateur</h2>
    <p>
        login :
        <% passageList = passages.getAllPassages();%>
        <% if (request.getMethod().equals("GET")) {
            String login = request.getParameter("login");
            for (Passage passage : passageList) {
                if (passage.getUser().getLogin().toLowerCase().equals(login)) {
                    out.println(login);
                } else {
                    response.setStatus(404);
                }

            }
        }

        %>

<%--        <c:forEach items="<%= passageList %>" var="passage">--%>

<%--            ${passage.user.login}--%>
<%--        </c:forEach>--%>
    </p>

</body>
</html>
