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
        <div id="topbar"></div>


        <div id="indhold">
            ${message} ${customers.size()}<br><br>
            <c:forEach var="customer" items="${customers}">

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
                        <td style="width:20%"> ${customer.cpr}</td>
                        <td style="width:20%"> ${customer.name}</td>
                        <td style="width:20%"> ${customer.address}</td>
                        <td style="width:20%"> ${customer.phone}</td>
                        <td style="width:20%"> ${customer.email}</td>

                        <td><form action="Controller?command=list-accounts&cpr=${customer.cpr}"
                                  method="post">
                                <input type="submit" name="listaccounts" id="listaccounts" value="List Accounts" />
                            </form>

                        </td>


                    </tr>
                </table>


            </c:forEach></div>



        <div id="menubar">   
            <a class="mlink" href="Controller?command=back">Back to main page</a>
        </div><hr/>
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>
