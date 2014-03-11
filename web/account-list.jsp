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
                                <input type="hidden" name="selectedAccount" id="selectedAccount" value="${account.number}" />
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
                <a class="mlink" href="Controller?command=add-account">Add account</a>

            </p></div>
        <hr/> 
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>
