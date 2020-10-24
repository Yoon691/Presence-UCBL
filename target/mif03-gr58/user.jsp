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
<%@ page import="fr.univlyon1.m1if.m1if03.classes.User" %>

<jsp:useBean id="passages" class="fr.univlyon1.m1if.m1if03.classes.GestionPassages"
             scope="application">
</jsp:useBean>

<%List<Passage>passageList;%>
<%
    User user = (User) request.getSession().getAttribute("user");
    User userCurrent = null;
    passageList = passages.getAllPassages();
    for (Passage passage : passageList) {
        if (passage.getUser().getLogin().equals(user.getLogin())) {
            userCurrent = new User(user.getLogin());
        }
    }
    if(userCurrent != null) {
%>
<h1>User <%=user.getLogin() %></h1>
<h3>Login : <%=user.getLogin() %></h3>
<% } else { %>
<h3> Utilisateur <%=user.getLogin() %> non trouvé </h3>
<%} %>