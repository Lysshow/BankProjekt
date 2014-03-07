<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Customer</title>
    <style>
      label {display: inline; width: 8em; text-align: left; float: left;}
      fieldset {width: 20em;padding: 1em;}
    </style>
  </head>
  <body>
    <h1>Add customer</h1>
    <p>This page should be visible for SuperEmployees only</p>
    <fieldset>
      <legend>Customer Details</legend>
      <Form>
        <div>
          <div><label for="cpr">CPR</label><input type="text" name="cpr" id="cpr" required/></div>
          <div><label for="fname">First Name</label><input type="text" name="fname" id="fname" required/></div>
          <div><label for="lname">Last Name</label><input type="text" name="lname" id="lname" required/></div>
          <div><label for="email">Email</label><input type="email" name="email" id="email"/></div>
        </div>
        <input type="hidden" name="command" value="save-customer">
        <input type="hidden" name="title" value="President of Awesomeness">
        <input type="hidden" name="street" value="Vej 38">
        <input type="hidden" name="postalCode" value="1234">
        <input type="hidden" name="postalDistrict" value="Awesomeville">
        <input type="hidden" name="phone" value="19191919">
        <br/>
        <input type="submit" value="save"/>
      </Form>
    </fieldset>
    <br/>
    <ul >
      <li><a href="Controller?command=main">Back to main</a></li>
      <li><a href="Controller?command=list-customers">Customer List</a></li>
    </ul>
  </body>
</html>
