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
    <h1>Account list</h1>
    <hr/>
    ${message} for CPR: ${customer.cpr}<br>
    No. of accounts: ${accounts.size()}<br><br>
    
   
    
    
    <c:forEach var="account" items="${accounts}">
      <br/>
      
      <table  border="1" style="width:500px" border color="black" bgcolor="cornflowerblue">
          <tr style bgcolor="lightblue" font color="white">
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
               <td><a href="Controller?command=details-accounts&accountNR=${account.number}"</a> See Details</td>
               <td><a href="Controller?command=transfer"</a>Transfer money from this account</td>
          </tr>
      </table><br>
    </c:forEach>
    <hr/> 
    <!-- a href="Back">Back to main page</a -->
    <ul><li><a href="Controller?command=back">Back to main page</a></li>
        <li><a href="Controller?command=list-customers">Back to customer list</a></li></ul>
</html>
