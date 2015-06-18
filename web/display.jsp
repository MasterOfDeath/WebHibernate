<%-- 
    Document   : display
    Created on : 18.06.2015, 18:14:06
    Author     : rinat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String firstName = request.getParameter("first");
            String lastName = request.getParameter("last");
            String emailAddress = request.getParameter("email");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            %>
            <table border="1">
                <tbody>
                    <tr>
                        <td>First name: </td>
                        <td><%= firstName %></td>
                    </tr>
                    <tr>
                        <td>Last name: </td>
                        <td><%= lastName %></td>
                    </tr>
                    <tr>
                        <td>Email Address</td>
                        <td><%= emailAddress %></td>
                    </tr>
                    <tr>
                        <td>Gender: </td>
                        <td><%= gender %></td>
                    </tr>
                    <tr>
                        <td>Date of Birth: </td>
                        <td><%= dob %></td>
                    </tr>
                </tbody>
            </table>

    </body>
</html>
