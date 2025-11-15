package uz.pdp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.entity.Book;
import uz.pdp.service.BookService;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "BookServlet", value = "/books")
public class BookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            Book book = BookService.findBookById(id);
            req.setAttribute("book", book);
            resp.sendRedirect("/findBookById.jsp");
        } else {
//            List<Book> books = BookService.findAllBooks();
//            req.setAttribute("books", books);
//            req.getRequestDispatcher("/findAllBooks.jsp").forward(req, resp);
            resp.sendRedirect("/books.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String pagesStr = req.getParameter("pages");
        String author = req.getParameter("author");

        try {
            BookService.createBook(name, Integer.parseInt(pagesStr), author);
            req.setAttribute("message", "Book added successfully!");
        } catch (SQLException e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }

        resp.sendRedirect("/addBook.jsp");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String pagesStr = req.getParameter("pages");
        String author = req.getParameter("author");

        try {
            BookService.updateBook(
                    Integer.parseInt(idStr),
                    name,
                    pagesStr.isEmpty() ? null : Integer.parseInt(pagesStr),
                    author
            );
            req.setAttribute("message", "Book updated successfully!");
        } catch (SQLException e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }
        resp.sendRedirect("/updateBook.jsp");
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");

        try {
            BookService.deleteBook(Integer.parseInt(idStr));
            req.setAttribute("message", "Book deleted successfully!");
        } catch (SQLException e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }

        resp.sendRedirect("/deleteBook.jsp");
    }
}
