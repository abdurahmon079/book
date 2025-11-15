package uz.pdp.service;

import uz.pdp.entity.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookService {

    private static final String URL = "jdbc:postgresql://localhost:5432/postgres";
    private static final String USER = "postgres";
    private static final String PASSWORD = "abdurahmon2006";

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL Driver not found", e);
        }
    }

    // CREATE
    public static void createBook(String name, int pages, String author) throws SQLException {
        Book book = Book.builder()
                .name(name)
                .pages(pages)
                .author(author)
                .build();

        String sql = "INSERT INTO books (name, pages, author) VALUES (?, ?, ?) RETURNING id";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, book.getName());
            statement.setInt(2, book.getPages());
            statement.setString(3, book.getAuthor());

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Long generatedId = rs.getLong("id");
                book.setId(generatedId);
            }
        } catch (SQLException e) {
            System.err.println("Error inserting book: " + e.getMessage());
            throw e;
        }
    }

    // READ ALL
    public static List<Book> findAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement()) {

            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Book book = Book.builder()
                        .id(rs.getLong("id"))
                        .name(rs.getString("name"))
                        .pages(rs.getInt("pages"))
                        .author(rs.getString("author"))
                        .build();
                books.add(book);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching books: " + e.getMessage());
        }

        return books;
    }

    // READ BY ID
    public static Book findBookById(int id) {
        String sql = "SELECT * FROM books WHERE id = ?";
        Book book = null;

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                book = Book.builder()
                        .id(rs.getLong("id"))
                        .name(rs.getString("name"))
                        .pages(rs.getInt("pages"))
                        .author(rs.getString("author"))
                        .build();
            }

        } catch (SQLException e) {
            System.err.println("Error fetching book: " + e.getMessage());
        }

        return book;
    }

    // UPDATE
    public static void updateBook(int id, String name, Integer pages, String author) throws SQLException {
        String sql = "UPDATE books SET name = ?, pages = ?, author = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, name);
            statement.setInt(2, pages);
            statement.setString(3, author);
            statement.setInt(4, id);

            int rowsUpdated = statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating book: " + e.getMessage());
            throw e;
        }
    }

    // DELETE
    public static void deleteBook(int id) throws SQLException {
        String sql = "DELETE FROM books WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

        } catch (SQLException e) {
            System.err.println("Error deleting book: " + e.getMessage());
            throw e;
        }
    }
}
