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

            function getCount(){
            $.ajax({
                    url: "WannabeKrak",
                    cache: false,
                    data: {
                        command: "count"
                    },
                    dataType: "text/plain"
                    
            }).done(function(data) {
            alert("woop"+data);
            });
            }

        </script>
    </head>
    <body>

       
        <input type="submit" id="count" onclick="getCount();" name="count">
    </body>
</html>
