
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Transfer Form</title>
        <link type="text/css" rel="stylesheet" href="default.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Style for a traditional Browser -->
        <style >
            body {font-family: sans-serif;}
            .container {width:20em;border: lightgray thin solid; padding: 0.5em; 
                        margin-left: auto;margin-right: auto;margin-top: 2em;}
            .ndLabel {
                display: block;  width: 5em;text-align: right;
                float: left;margin-right: 0.5em;
            }
            fieldset {margin-bottom: 0.4em;}
            .checkbox {margin-left: 1.5em;}
            .fs1 {float: left; margin-right: 0.5em;} 
        </style>
        <!--Style for a Mobile Browser -->
        <!--        <style >
                    body {font-family: sans-serif;}
                    .container {width:12em; padding: 0.5em;}
                    .ndLabel {
                        display: block;
                        width: 5em;
                        text-align: left;
                        margin-right: 0.5em;
                    }
                    fieldset {margin-bottom: 0.4em;}
                    .checkbox {margin-left: 1.5em;}
                </style>-->
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

        <div id="indhold"></div>

        <div id="menubar">   
            <a class="mlink" href="Controller?command=back">Back to main page</a>
        </div>
        <div class="container" >
            <!--<form action="RequestParameters">-->
            <form action="Controller">
                <fieldset>
                    <legend>Transfer Details</legend>
                    <div>
                        <label class='ndLabel' for='title'>F. account</label>
                        <select name="fromAccount" id='fromAccount'>
                            <c:forEach var="account" items="${ownAccount}">
                                <option name="fromAccount"value=${account.number} selected=${selected}>${account.number}</option>
                            </c:forEach>
                                
                        </select>
                    </div>
                    <div>
                        <label class='ndLabel' for='title'>T. account</label>
                        <select name="toAccount" id='toAccount'>
                            <c:forEach var="account" items="${summary}">
                                <option name="toAccount"value=${account.number} selected="selected">${account.number}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div>
                        <label for='amount' class='ndLabel' >Amount</label> <input name="amount" id='amount' type="text">
                    </div>
                    <div>
                        <label for='message' class='ndLabel' >Message</label> <input name="message" id='message' type="text">
                    </div>
                    <div>
                        <label for='date' class='ndLabel' >Date</label> <input name="date" id='date' type="text">
                    </div>
                    <div>
                        <input type="hidden" name="cpr" id="cpr" value="${cpr}" />
                        <button type="submit" name="command" value="transferMoney" >Transfer</button>
                        <!--<input type="submit" name="btnok" value="Transfer">-->

                        <input type="reset" value="Clear">
                    </div>
                </fieldset>
            </form>
        </div>

        <hr/>
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>

