package com.portfolio.dao;

import com.portfolio.model.ContactMessage;
import com.portfolio.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object (DAO) for Contact Messages.
 * Encapsulates all JDBC interactions with portfolio_db.
 */
public class ContactDAO {

    private static final String INSERT_SQL = "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_SQL = "SELECT id, name, email, subject, message, created_at FROM contact_messages ORDER BY id DESC";

    /**
     * Inserts a new contact message into MySQL via JDBC PreparedStatement.
     * @param msg The ContactMessage bean
     * @return true if insertion succeeds, false otherwise
     */
    public boolean saveMessage(ContactMessage msg) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            ps.setString(1, msg.getName());
            ps.setString(2, msg.getEmail());
            ps.setString(3, msg.getSubject());
            ps.setString(4, msg.getMessage());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Database error during saveMessage: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves all recorded messages from the database.
     * @return List of ContactMessage objects
     */
    public List<ContactMessage> getAllMessages() {
        List<ContactMessage> list = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ContactMessage msg = new ContactMessage();
                msg.setId(rs.getInt("id"));
                msg.setName(rs.getString("name"));
                msg.setEmail(rs.getString("email"));
                msg.setSubject(rs.getString("subject"));
                msg.setMessage(rs.getString("message"));
                msg.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(msg);
            }

        } catch (SQLException e) {
            System.err.println("Database error during getAllMessages: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }
}
