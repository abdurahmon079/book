<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/15/2025
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="uz.pdp.entity.Book" %>
<%@ page import="uz.pdp.service.BookService" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Books</title>
  <style>
    body { font-family:'Poppins'; background:linear-gradient(120deg,#0f0c29,#302b63,#24243e); color:white; padding:30px; }
    table { width:100%; border-collapse:collapse; }
    th, td { padding:12px; border-bottom:1px solid rgba(255,255,255,0.2); text-align:left; }
    tr:hover { background: rgba(255,255,255,0.1);}
    th { color:#ff6ec7; }
    h3 { text-align:center; color:#ff6ec7; }
  </style>
</head>
<body>
<h3>All Books</h3>
<table>
  <tr>
    <th>ID</th>
    <th>Title</th>
    <th>Pages</th>
    <th>Author</th>
  </tr>
  <%
    List<Book> books = BookService.findAllBooks();
    for(Book b: books){
  %>
  <tr>
    <td><%=b.getId()%></td>
    <td><%=b.getName()%></td>
    <td><%=b.getPages()%></td>
    <td><%=b.getAuthor()%></td>
  </tr>
  <% } %>
</table>
</body>
</html>

