<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<section>
    <h1>Passages dans une salle</h1>

    <form method="get" action="<c:url value="/admin"/>">
        <label>
            Nom de la salle cherchée :
            <input type="text" name="nomSalle" autofocus>
        </label>
        <input type="hidden" name="contenu" value="passages">
        <input type="submit" value="Envoyer">
    </form>
</section>