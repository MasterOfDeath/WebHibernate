<%-- 
    Document   : index
    Created on : 18.06.2015, 16:31:58
    Author     : rinat
--%>

<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="ru.app.orm.Prod" %>
<%@page import="ru.app.service.DbService" %>
<%@page import="ru.app.controller.FilterServlet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Поиск по прайсу</title>
    </head>
    <body>
        
        <form name="filterForm" action="FilterServlet" method="POST">
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
                    <td><input type="text" name="price2Input" value="10000000" size="10" /></td>
                    <td><input type="submit" value="Найти" name="serachBtn" /></td>
                </tr>
            </tbody>
        </table>

        <br />
        
        <%
        
            DbService dbService = (DbService)session.getAttribute("service");
            
            if (dbService == null) {
                %>
                <jsp:forward page="/FilterServlet"/> 
            <%}
            
            List<Prod> prods;
            if (dbService != null) {
                prods = dbService.getFiltered();
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
            <% } 
            
            }
            %>
          
        </tbody>
        </table>
        
        </form>
    </body>
</html>
