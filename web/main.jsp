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

        <div id="topbar">

            <div id="login">
                <c:choose >
                    <c:when test="${pageContext.request.remoteUser== null}">
                        <a href="Redirect?command=showlogin">Login</a>
                    </c:when>
                    <c:otherwise>
                        <a href="Redirect?command=logout">Log out</a></li>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>



        <div id="indhold">
            <p class="indhold">Welcome to Goliath National Bank! <br> We are currently working on our website,
                and we hope to be up and running soon.<br><br>

                Stay tuned for updates<br><br>

                kind regards<br>
                -Nahl Team </p><br><br><br><br>

        </div>

    </div>
    <div id="menubar">
        <c:if test="${pageContext.request.isUserInRole('Customer')}">
            <a class="mlink" href="Controller?command=list-customers">Customer List</a>
        </c:if >
        <c:if test="${pageContext.request.isUserInRole('Employee') || pageContext.request.isUserInRole('SuperEmployee')}">
            <a class="mlink" href="Controller?command=list-customers">Employee List</a>
        </c:if>
        <a class="mlink" href="ny_kategori/index.htm">Til anden kategori</a>
        <a class="mlink" href="http://www.server.dk/fremmed.htm">Til en andens side</a>
        <a class="mlink" href="Controller?command=list-customers">Customer List</a>
        <a class="mlink" href="Controller?command=add-customer">Add Customer</a>
        <a class="mlink" href="Controller?command=add-account">Add Account</a>
        <a class="mlink" href="Controller?command=hello">Test Backend implementation</a>

    </div>
    <hr/> 
    <div id="footer">Copyright © NAHL GROUP</div>
</body>
</html>
