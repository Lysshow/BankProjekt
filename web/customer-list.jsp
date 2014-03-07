<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer list</title>
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
        <p>
            ${message} ${customers.size()}<br><br>
            <c:forEach var="customer" items="${customers}"></p>

                <table>
                    <tr class="row">
                        <th>CPR number:</th>
                        <th>Customer Name</th>
                        <th>Address: </th>
                        <th>PhoneNo: </th>
                        <th>Email: </th>
                        <th>Accounts:</th>
                    </tr>
                    <tr>
                        <td> ${customer.cpr}</td>
                        <td> ${customer.name}</td>
                        <td> ${customer.address}</td>
                        <td> ${customer.phone}</td>
                        <td> ${customer.email}</td>

                        <td><form action="Controller?command=list-accounts&cpr=${customer.cpr}"
                                  method="post">
                                <input type="submit" name="listaccounts" id="listaccounts" value="List Accounts" />
                            </form>

                        </td>


                    </tr>
              


            </c:forEach>
        
          </table>
        </div>
        
        <div id="menubar">   
            <a class="mlink" href="Controller?command=back">Back to main page</a>
        </div>
            <hr/>
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>
