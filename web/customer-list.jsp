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
    <h1>Customer list</h1>
    <hr/>
    ${message} ${customers.size()}<br><br>
    
    
      
    <c:forEach var="customer" items="${customers}">
  
    <table  border="1" style="width:1000px" border color="black" bgcolor="cornflowerblue">
          <tr style bgcolor="lightblue" font color="white">
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
              
              <td><a href="Controller?command=list-accounts&cpr=${customer.cpr}">List accounts</a> </td>
      
      
          </tr>
      </table>
   
    
    </c:forEach>
    
   <hr/> 
   
    <!-- a href="Back">Back to main page</a -->
    <ul><li>
      <a href="Controller?command=back">Back to main page</a>
    </li>
    </ul>
    
</html>
