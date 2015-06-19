<%-- 
    Document   : index
    Created on : 18.06.2015, 16:31:58
    Author     : rinat
--%>

<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ru.app.orm.Prod" %>
<%@page import="ru.app.service.DbService" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Поиск по прайсу</title>
    </head>
    <body>
        
        <br />
        <br />
        Прайс лист
        <br />
        <br />
        
        <table border="0">
            <tbody>
                <tr>
                    <td>Категория:</td>
                    <td>Наименование:</td>
                    <td>Цена от:</td>
                    <td>Цена до:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="catInput" value="" size="15" /></td>
                    <td><input type="text" name="nameInput" value="" size="15" /></td>
                    <td><input type="text" name="price1Input" value="" size="10" /></td>
                    <td><input type="text" name="price2Input" value="" size="10" /></td>
                    <td><input type="submit" value="Найти" name="serachBtn" /></td>
                </tr>
            </tbody>
        </table>

        <br />
        
        <%!
        
            DbService dbService = new DbService();
            List<Prod> prods = dbService.getAll();
        
            Iterator<Prod> prodItr = prods.iterator();
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>Категория</th>
                    <th>Нименование</th>
                    <th>Цена</th>
                </tr>
            </thead>
        <tbody>
            <% for (int i = 0; i < prods.size(); i++) {
                    Prod prod = prods.get(i);
            %>
            <tr>
                <td><%= prod.getCat().getCatName() %></td>
                <td><%= prod.getName() %></td>
                <td><%= prod.getPrice() %></td>
            </tr>
            <% } %>
        </tbody>
        </table>
        
           
        
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
