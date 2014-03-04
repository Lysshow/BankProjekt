<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bank main page</title>
    <link type="text/css" rel="stylesheet" href="default.css"/>
  </head>
  <body>
      

      
    <svg width="150" height="100">
  <polygon points="50,5 20,90 95,30 5,30 80,90"
  style="fill:blue;stroke:black;stroke-width:5;fill-rule:evenodd;" /></svg>
  <h1>Goliath National Bank ${message}</h1>
  
    <hr/>
    <ul>
      <!-- li><a href="ListAccounts">List accounts</a></li -->
      
      <li><a href="Controller?command=list-customers">List customers</a></li>
      <li><a href="">List employees</a></li>
      <li><a href="">Login</a></li>
    </ul>
    
  </body>
</html>
