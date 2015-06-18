<%-- 
    Document   : index
    Created on : 18.06.2015, 16:31:58
    Author     : rinat
--%>

<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Today's Date</title>
    </head>
    <%
        Date date = new Date();
        %>
    <body>
        
        <%!
        public class Actor {
            String URL = "jdbc:mysql://localhost:3306/sakila";
            String USERNAME = "root";
            String PASSWORD = "qweqwe";
            
            Connection connection = null;
            PreparedStatement selectActors = null;
            ResultSet resultSet = null;
            
            public Actor(){
                try {
                    connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                    
                    selectActors = connection.prepareStatement("SELECT actor_id,first_name,last_name FROM actor");
                    
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            
            public ResultSet getActors() {
                try {
                    resultSet = selectActors.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return resultSet;
            }
        }
        %>  
        
        <%
            Actor actor = new Actor();
            ResultSet actors = actor.getActors();
        %>
        
        <table border="1">
            <tbody>
                <tr>
                    <td>Actor ID</td>
                    <td>First Name</td>
                    <td>Last Name</td>
                </tr>
                <% while (actors.next()) {%>
                <tr>
                    <td><%= actors.getInt("actor_id") %></td>
                    <td><%= actors.getString("first_name") %></td>
                    <td><%= actors.getString("last_name") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        
        <h1>Today's Date</h1>
        <p>Today's date is <%= date %></p>
        
        <form name="myForm" action="display.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>First name: </td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last name: </td>
                        <td><input type="text" name="last" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Email Address</td>
                        <td><input type="text" name="email" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Gender: </td>
                        <td><select name="gender">
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Date of Birth: </td>
                        <td><input type="text" name="dob" value="DD/MM/YYY" size="15" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
        
    </body>
</html>
