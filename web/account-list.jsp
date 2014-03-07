<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account list</title>
        <link type="text/css" rel="stylesheet" href="default.css"/>
    </head>
    <body>
         <svg width="150" height="100">
  <polygon points="50,5 20,90 95,30 5,30 80,90"
  style="fill:#483d8b;stroke:black;stroke-width:5;fill-rule:evenodd;" /></svg>
        <div id="topbar"><h1>Account list</h1></div>
        <hr/>
        <div id="indhold">  ${message} for CPR: ${customer.cpr}<br>
        No. of accounts: ${accounts.size()}<br><br>
        

        <c:forEach var="account" items="${accounts}">
            <br/>

            <table>
                <tr class="row">
                    <th>Account No:</th>
                    <th>Account Type:</th>
                    <th>Account Balance:</th>
                    <th>Account Details:</th>
                    <th>Account Options:</th>
                </tr>
                <tr>
                    <td>${account.number}</td>
                    <td> ${account.type} </td>
                    <td> ${account.balance} </td>


                    <td> 
                        <form action="Controller?command=details-accounts&accountNR=${account.number}"
                              method="post">
                            <input type="hidden" name="cpr" id="cpr" value="${customer.cpr}" />
                            <input type="submit" name="listdetails" id="listdetailsButton" value="Account Details" />
                        </form>
                    </td>
                <td>  <form action="Controller?command=transfer"
                      method="post">
                    <input type="hidden" name="cpr" id="cpr" value="${customer.cpr}" />
                    <input type="submit" name="transfer" id="transferButton" value="Transfer money" />
                </form>
            </td>
            
        </tr>
    </table><br>
</c:forEach>
    </div>
    
        <div id="menubar">   
            <p class="midt">
                <a class="mlink" href="Controller?command=back">Main page</a>
                <a class="mlink" href="Controller?command=list-customers">Customer list</a>
                
            </p></div>
<hr/> 
        <div id="footer">Copyright © NAHL GROUP</div>

</html>
