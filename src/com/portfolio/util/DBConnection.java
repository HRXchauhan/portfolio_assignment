package com.portfolio.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database Connection Utility for JDBC MySQL connection.
 * Web Technology (BCS502) - Semester V
 */
public class DBConnection {

    // Default configuration (Matches standard MySQL Server local installation)
    private static final String URL = System.getProperty("db.url", "jdbc:mysql://localhost:3306/portfolio_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
    private static final String USER = System.getProperty("db.user", "root");
    private static final String PASSWORD = System.getProperty("db.password", "root"); // default root/root or change as per local setup

    static {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            try {
                // Fallback for older MySQL connector versions
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                System.err.println("CRITICAL: MySQL JDBC Driver not found in classpath! Place mysql-connector-j.jar in WEB-INF/lib");
            }
        }
    }

    /**
     * Obtains an active connection to the MySQL database.
     * @return Connection object
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
