<%-- 
    Document   : add-account
    Created on : 07-03-2014, 12:11:46
    Author     : Mads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Account</title>
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
            <Form action="Controller?command=save-account"
                  method="post">
                <div>
                    <div><label for="cpr">CPR</label><input type="text" name="cpr" id="cpr" value="${cpr}" required/></div>
                    <div><label for="interest">Interest</label><input type="text" name="interest" id="interest" required/></div>
                </div>
                <br/>
                <input type='submit' name="save-account" id="save-account" value='Save'/>
            </Form>

        </div>

        <div id="menubar">   
            <p class="midt">
                <a class="mlink" href="Controller?command=back">Back to main page</a>
                <a class="mlink" href="Controller?command=list-accounts&cpr=${cpr}">Account list</a>
                <a class="mlink" href="Controller?command=list-customers">Customer list</a>
            </p></div>

        <hr/> 
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>
