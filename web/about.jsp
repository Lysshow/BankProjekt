

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
        <link type="text/css" rel="stylesheet" href="default.css"/>
    </head>
    <body>
        <div id="topbar">
            <div id="indhold">
                
                <p>
                <c:if test="${pageContext.request.isUserInRole('Customer')}">
                <div>Welcome Customer!</div>
                </c:if>
                </p>
                
                <div>Hello World this is the page about something important</div>
                <div>Det er fucking løgn: ${number}</div>

                <p>
                    <c:if test="${pageContext.request.isUserInRole('Employee') || pageContext.request.isUserInRole('SuperEmployee')}">
                    <div>Number of customers available: </div>${customers.size()}<br><br>
                </c:if>
                </p>
            </div>
        </div>

        <div id="menubar">   
            <a class="mlink" href="Controller?command=back">Back to main page</a>
        </div>
        
        <hr/>
        <div id="footer">Copyright © NAHL GROUP</div>

    </body>
</html>
