<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/15/2025
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="uz.pdp.service.BookService" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Book</title>
    <style>
        body { font-family:'Poppins'; background:linear-gradient(120deg,#0f0c29,#302b63,#24243e); color:white; display:flex; justify-content:center; align-items:center; min-height:100vh;}
        .form-card { background: rgba(0,0,0,0.5); backdrop-filter:blur(18px); padding:35px; border-radius:22px; width:400px; }
        input, button { width:100%; padding:12px; margin:10px 0; border-radius:10px; border:none; font-size:16px; }
        button { background:linear-gradient(135deg,#f85032,#e73827); color:white; cursor:pointer; }
        h3 { text-align:center; color:#ff6ec7; margin-top:0; }
    </style>
</head>
<body>
<div class="form-card">
    <h3>Delete Book</h3>
    <form method="post">
        <input type="number" name="id" placeholder="Book ID" required>
        <button type="submit">Delete</button>
    </form>
    <%
        if(request.getMethod().equalsIgnoreCase("POST")){
            String idStr = request.getParameter("id");
            try {
                BookService.deleteBook(Integer.parseInt(idStr));
                out.println("<p style='color:lightgreen;text-align:center;'>Book deleted successfully!</p>");
            } catch (SQLException e) {
                out.println("<p style='color:red;text-align:center;'>Error: "+e.getMessage()+"</p>");
            }
        }
    %>
</div>
</body>
</html>

