<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customer</title>
        <link type="text/css" rel="stylesheet" href="default.css"/>
        <style>
            label {display: inline; width: 8em; text-align: left; float: left;}
            fieldset {width: 20em;padding: 1em;}
        </style>
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
        </div>
        <div id="menubar">
            <a class="mlink" href="Controller?command=back">Back to main page</a>
            <a class="mlink" href="Controller?command=list-customers">Customer List</a>
        </div>
        <hr/>
        <div id="footer">Copyright © NAHL GROUP</div>
    </body>
</html>
