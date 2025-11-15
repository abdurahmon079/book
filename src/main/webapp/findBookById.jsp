<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/15/2025
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="uz.pdp.entity.Book" %>
<%@ page import="uz.pdp.service.BookService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Book By ID</title>
    <style>
        body { font-family:'Poppins'; background:linear-gradient(120deg,#0f0c29,#302b63,#24243e); color:white; display:flex; justify-content:center; align-items:flex-start; min-height:100vh; padding-top:50px;}
        .form-card { background: rgba(0,0,0,0.5); backdrop-filter:blur(18px); padding:35px; border-radius:22px; width:400px; margin-bottom:20px;}
        input, button { width:100%; padding:12px; margin:10px 0; border-radius:10px; border:none; font-size:16px; }
        button { background:linear-gradient(135deg,#4facfe,#00f2fe); color:white; cursor:pointer; }
        h3 { text-align:center; color:#ff6ec7; margin-top:0; }
        table { width:100%; border-collapse:collapse; margin-top:20px; }
        th, td { padding:12px; border-bottom:1px solid rgba(255,255,255,0.2); text-align:left; }
        tr:hover { background: rgba(255,255,255,0.1);}
        th { color:#ff6ec7; }
    </style>
</head>
<body>
<div class="form-card">
    <h3>Find Book By ID</h3>
    <form method="get">
        <input type="number" name="id" placeholder="Book ID" required>
        <button type="submit">Find</button>
    </form>

    <%
        if(request.getParameter("id") != null){
            int id = Integer.parseInt(request.getParameter("id"));
            Book book = BookService.findBookById(id);
            if(book != null){
    %>
    <table>
        <tr><th>ID</th><td><%=book.getId()%></td></tr>
        <tr><th>Title</th><td><%=book.getName()%></td></tr>
        <tr><th>Pages</th><td><%=book.getPages()%></td></tr>
        <tr><th>Author</th><td><%=book.getAuthor()%></td></tr>
    </table>
    <%  } else { %>
    <p style="text-align:center;color:red;">Book not found.</p>
    <% } } %>
</div>
</body>
</html>

