<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        
        <form method="POST" action="j_security_check">
            <p> Brugernavn: </p> <input type="text" name="j_username"><br>
            <p> Password: </p>   <input type="password" name="j_password"><br>
            <input type="submit" value="Login"><br>
            <p style="color: red;">${param.errormsg}</p>
    
            </body>
</html>
