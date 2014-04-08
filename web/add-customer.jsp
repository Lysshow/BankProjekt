<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Customer</title>
        <link type="text/css" rel="stylesheet" href="default.css"/>
      

            <script src="js/jquery-1.9.1.js"></script>
            <!--    <script src="js/jquery.validate.js"></script>-->
            <script src="js/validate.js"></script>
            <script>
                $(document).ready(function() {
                    jQuery.validator.addMethod("lettersonly", function(value, element) {
                        return this.optional(element) || /^[a-å]+$/i.test(value);
                    }, "Letters only please");

                    jQuery.validator.addMethod("numbersonly", function(value, element) {
                        return this.optional(element) || /^[0-9]+$/i.test(value);
                    }, "Numbers only please");
                    // validate the comment form when it is submitted
                    $("#myform").validate({
                        rules: {
                            fname: {required: true, minlength: 2, lettersonly: true},
                            lname: {required: true, minlength: 2, lettersonly: true},
                            email: {required: true, email: true, remote: "EmailServlet"},
                            phone: {required: true, phone: true, numbersonly: true, remote: "WannabeKrak"}
                        },
                        messages: {
                            fname: {
                                required: "Please enter you first name",
                                minlength: jQuery.format("At least {0} characters required!"),
                                
                            },
                            lname: {
                                required: "Please enter your lastname",
                                minlength: jQuery.format("At least {0} characters required!"),
                                
                            },
                            email: {
                                required: "Please enter a valid email",
                                remote: "Already exists"
                            },
                            phone: {
                                remote: "Already exists"
                            }
                        }
                        //,
                        //errorLabelContainer: "#errors", wrapper: "div"
                    });
                });
            </script>


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
                <form id="myform">
                    <div>

                        <c:if test="${customer== null}">
                            <div><label for="cpr">CPR</label><input type="text" name="cpr" id="cpr" value="${customer.cpr}" required/></div>
                            </c:if>
                            <c:if test="${customer!= null}">
                            <div><label for="cpr">CPR</label><input type="text" name="cpr" id="cpr" value="${customer.cpr}" disabled required/></div>
                            </c:if>
                        <div><label for="fname">First Name</label><input type="text" name="fname" id="fname" value="${customer.firstName}"required/></div>
                        <div><label for="lname">Last Name</label><input type="text" name="lname" id="lname" value="${customer.lastName}"required/></div>
                        <div><label for="email">Email</label><input type="email" name="email" id="email" value="${customer.email}"/></div>
                        <div><label for="phone">Phone Nr.</label><input type="phone" name="phone" id="phone" value="${customer.phone}"/></div>
                        <div><label for="street">Street</label><input type="street" name="street" id="street" value="${customer.street}"/></div>
                        <div><label for="postalcode">Postal code</label><input type="text" name="postalCode" id="postalCode" value="${customer.postalCode}"/></div>
                        <div><label for="postalDistrict">Postal district</label><input type="postalDistrict" name="postalDistrict" id="postalDistrict" value="${customer.postalDistrict}"/></div>
<!--                        <div><label for="title">Title</label><input type="title" name="title" id="title" value="${customer.title}"/></div>-->
                    </div>
                    <input type="hidden" name="command" value="save-customer">
                    <input type="hidden" name="command" value="phone">
                    <br/>
                    <input type="submit" value="Save"/>
                    <input type="submit" value="Hent"/>
                </form>
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
