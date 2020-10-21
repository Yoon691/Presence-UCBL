<%--
  Created by IntelliJ IDEA.
  User: barry
  Date: 18/10/2020
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="fr.univlyon1.m1if.m1if03.classes.Passage" %>



<jsp:useBean id="passages" class="fr.univlyon1.m1if.m1if03.classes.GestionPassages"
             scope="application">
</jsp:useBean>

<html>
<head>
    <title>Salles</title>
</head>
<body>
    <h1>Liste de toutes les salles</h1>
    <%List<Passage> passageList;%>
    <%passageList = passages.getAllPassages(); %>
    <c:forEach items="<%= passageList %>" var="passage">
        ${passage.salle.nom}<br>
    </c:forEach>
</body>
</html>
