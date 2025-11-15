<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/15/2025
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="uz.pdp.service.BookService" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Book</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <style>
    body { font-family:'Poppins', sans-serif; background: linear-gradient(120deg,#0f0c29,#302b63,#24243e); color:white; min-height:100vh; display:flex; justify-content:center; align-items:center;}
    .form-card { background: rgba(0,0,0,0.5); backdrop-filter:blur(18px); padding:35px; border-radius:22px; width:400px; }
    input, button { width:100%; padding:12px; margin:10px 0; border-radius:10px; border:none; font-size:16px; }
    button { background:linear-gradient(135deg,#4facfe,#00f2fe); color:white; cursor:pointer; }
    h3 { text-align:center; color:#ff6ec7; margin-top:0; }
  </style>
</head>
<body>
<div class="form-card">
  <h3>Add Book</h3>
  <form method="post">
    <input type="text" name="title" placeholder="Title" required>
    <input type="number" name="pages" placeholder="Pages" required>
    <input type="text" name="author" placeholder="Author" required>
    <button type="submit">Add</button>
  </form>
  <%
    if(request.getMethod().equalsIgnoreCase("POST")){
      String title = request.getParameter("title");
      String pagesStr = request.getParameter("pages");
      String author = request.getParameter("author");

      try {
        BookService.createBook(title, Integer.parseInt(pagesStr), author);
        out.println("<p style='color:lightgreen;text-align:center;'>Book added successfully!</p>");
      } catch (SQLException e) {
        out.println("<p style='color:red;text-align:center;'>Error: "+e.getMessage()+"</p>");
      }
    }
  %>
</div>
</body>
</html>

