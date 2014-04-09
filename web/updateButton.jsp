<%-- 
    Document   : updateButton
    Created on : Apr 8, 2014, 1:29:21 PM
    Author     : Shandi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Count Page</title>
        <script src="js/jquery-1.9.1.js"></script>
        <script>

            var xMLHttpRequest = new xMLHttpRequest();
            function getCount(){
            $.ajax({
                    url: "http://datdb.cphbusiness.dk:8080/KrakRemote/service/request/thisuser",
                    type: "GET",
                    data: "group-e",
                    cache: false,
                    dataType: "text/plain"
            }).done(function(data) {
            alert(data);
            });
            }

        </script>
    </head>
    <body>

       
        <input type="submit" id="count" onclick="getCount();" name="count">
    </body>
</html>
