

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Details</title>
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
   
        <div id="indhold"> ${message} for  ${history.number}<br>
            Interest: <fmt:formatNumber value="${history.interest}" maxFractionDigits="3"/><br>
            Type: ${history.type}<br><br>
            <table>
                <tr class="row2">
                    <th colspan="3">Transfer Summeries: </th>
                </tr>

                <tr>
                    <th class="transfersummaries">Amount: </th>
                    <th class="transfersummaries">Date: </th>
                    <th class="transfersummaries">Target Account No: </th>   
                </tr>


                <c:forEach var="transfer" items="${history.transfers}"> 


                    <tr>      
                        <td>${transfer.amount}</td>
                        <td><fmt:formatDate value="${transfer.date}"/></td>
                        <td>${transfer.accountNumber}</td>

                    </tr>
                </c:forEach>

                </tr>

            </table><br>  


            <br><br></div>


        <div id="menubar">   
            <p class="midt">
                <a class="mlink" href="Controller?command=list-accounts&cpr=${cpr}">List accounts</a>
                <a class="mlink" href="Controller?command=back">Back to main page</a>

            </p></div>

        <hr/> 
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>
