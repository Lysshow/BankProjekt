<%-- 
    Document   : add-account
    Created on : 07-03-2014, 12:11:46
    Author     : Mads
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Account</title>
    </head>
    <body>
       
        <Form action="Controller?command=save-account"
              method="post">
        <div>
          <div><label for="cpr">CPR</label><input type="text" name="cpr" id="cpr" required/></div>
          <div><label for="interest">Interest</label><input type="text" name="interest" id="interest" required/></div>
        </div>
        <br/>
        <input type='submit'name="save-account" id="save-account" value='save-account'/>
      </Form>

    <li><a href="Controller?command=main">Back to main</a></li>
    <li><a href="Controller?command=list-customers">Customer List</a></li>
</body>
</html>
