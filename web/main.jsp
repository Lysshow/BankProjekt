<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank main page</title>
        <link type="text/css" rel="stylesheet" href="default.css"/>
    </head>
    <body>


        <svg width="150" height="100">
        <polygon points="50,5 20,90 95,30 5,30 80,90"
                 style="fill:blue;stroke:black;stroke-width:5;fill-rule:evenodd;" /></svg>
        <div id="topbar"><h1>Goliath National Bank ${message}</h1></div>


        <div id="indhold">
            <p class="indhold">Welcome to Goliath National Bank! <br> We are currently working on our website,
                and we hope to be up and running soon.<br><br>

                Stay tuned for updates<br><br>

                kind regards<br>
                -Nahl Team </p><br><br><br><br>

        </div>


        <div id="menubar">   
            <p class="midt">
                <c:if test="${pageContext.request.isUserInRole('Customer')==true}">
                    <a class="mlink" href="Controller?command=list-customers">Customer List</a>
                </c:if >
                <c:if test="${pageContext.request.isUserInRole('Employee')==true || pageContext.request.isUserInRole('SuperEmployee')==true}">
                    <a class="mlink" href="Controller?command=list-customers">Employee List</a>
                </c:if>
                <c:choose >
                    <c:when test="${pageContext.request.remoteUser== null}">
                    <li><a href="Redirect?command=showlogin">Login</a>
                    </c:when>
                    <c:otherwise>
                    <li><a href="Redirect?command=logout">Log out</a></li>
                    </c:otherwise>
                </c:choose>
            <a class="mlink" href="ny_kategori/index.htm">Til anden kategori</a>
            <a class="mlink" href="http://www.server.dk/fremmed.htm">Til en andens side</a>
        </p>

    </div><hr/>
    <div id="footer">Copyright © NAHL GROUP</div>
</body>
</html>
