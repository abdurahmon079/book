<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/15/2025
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>📚 Book Manager</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  <style>
    body {
      margin:0; padding:0; font-family:'Poppins', sans-serif;
      color:white; background: linear-gradient(-45deg, #1a2a6c, #b21f1f, #fdbb2d, #0f2027);
      background-size: 400% 400%; animation: gradientBG 15s ease infinite;
    }
    @keyframes gradientBG {0%{background-position:0% 50%;}50%{background-position:100% 50%;}100%{background-position:0% 50%;}}
    header { text-align:center; padding:30px; font-size:36px; font-weight:700; letter-spacing:2px; text-shadow:0 0 15px rgba(255,255,255,0.5);}
    .container { display:grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap:25px; width:90%; max-width:1200px; margin:30px auto;}
    .menu-card { background:rgba(255,255,255,0.1); backdrop-filter:blur(12px); border-radius:18px; padding:25px 15px; text-align:center; font-size:18px; font-weight:600; color:#fff; text-decoration:none; display:flex; flex-direction:column; align-items:center; justify-content:center; transition:0.3s; }
    .menu-card i { font-size:50px; margin-bottom:12px; color:#ffeb3b; transition: transform 0.3s, color 0.3s;}
    .menu-card:hover { transform: translateY(-7px); background: rgba(255,255,255,0.25); box-shadow:0 10px 25px rgba(0,0,0,0.3);}
    .menu-card:hover i { color:#00f2fe; transform: scale(1.2);}
  </style>
</head>
<body>
<header>📚 Book Manager</header>
<div class="container">
  <a class="menu-card" href="addBook.jsp"><i class="fa-solid fa-book-medical"></i>Add Book</a>
  <a class="menu-card" href="deleteBook.jsp"><i class="fa-solid fa-trash"></i>Delete Book</a>
  <a class="menu-card" href="findAllBooks.jsp"><i class="fa-solid fa-books"></i>Find All Books</a>
  <a class="menu-card" href="findBookById.jsp"><i class="fa-solid fa-magnifying-glass-book"></i>Find Book By ID</a>
  <a class="menu-card" href="updateBook.jsp"><i class="fa-solid fa-pen-to-square"></i>Update Book</a>
</div>
</body>
</html>