

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
        <h1>Account Details</h1>
        ${message} for  ${history.number}<br>
        Interest: <fmt:formatNumber value="${history.interest}" maxFractionDigits="3"/><br>
        Type: ${history.type}<br>
        <table  border="1" style="width:1000px" border color="black" bgcolor="cornflowerblue">
            <tr style bgcolor="lightblue" font color="white">
                <th colspan="3">Transfer Summeries: </th>
                </tr>




            <c:forEach var="transfer" items="${history.transfers}"> 
                <tr>
                    <th>Amount: </th>
                    <th>Date: </th>
                    <th>Target Accountno: </th>   
                </tr>

                <tr>      
                    <td align="center" style="width:20%">${transfer.amount}</td>
                    <td align="center">${transfer.date}</td>
                <td align="center">${transfer.accountNumber}</td>

                </tr>
            </c:forEach>
                
        </tr>

    </table><br>  
    <hr/>

    <br><br>
    <a href="Controller?command=list-accounts">List accounts</a><br>
    <a href="Controller?command=back">Back to main page</a>


    <hr>


</body>
</html>
