package com.shopNest.dbHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Central place for DB connection details.
 * Change the URL, username, and password here once — all classes pick it up.
 */
public class DBConnection {

    private static final String DRIVER   = "com.mysql.cj.jdbc.Driver";
    private static final String URL      = "jdbc:mysql://localhost:3306/shopnest";
    private static final String DB_USER  = "root";     // Change if your MySQL user is different
    private static final String DB_PASS  = "system"; // Change to your MySQL password

    // Utility class — no instances needed
    private DBConnection() {}

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, DB_USER, DB_PASS);
    }
}
