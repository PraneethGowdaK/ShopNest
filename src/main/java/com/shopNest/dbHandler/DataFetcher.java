package com.shopNest.dbHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shopNest.product.Product;

/**
 * Handles all SELECT queries against the database.
 * Every method uses try-with-resources so connections are always closed.
 */
public class DataFetcher {

    // Utility class — no instances needed
    private DataFetcher() {}

    /**
     * Returns the stored (hashed) password for a given username.
     * Returns an empty string if the user is not found.
     */
    public static String fetchPassword(String name) {
        String sql = "SELECT pass FROM customers WHERE uname = ?";
        String dbPass = "";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    dbPass = rs.getString(1);
                }
            }

        } catch (Exception e) {
            System.out.println("Error fetching password for user: " + name);
            e.printStackTrace();
        }

        return dbPass;
    }

    /**
     * Returns a list of all customers, each formatted as "name:mail:gender:address".
     */
    public static List<String> fetchUsersInfo() {
        String sql = "SELECT uname, mail, gender, address FROM customers";
        List<String> userList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                String row = rs.getString(1) + ":"
                           + rs.getString(2) + ":"
                           + rs.getString(3) + ":"
                           + rs.getString(4);
                userList.add(row);
            }

        } catch (Exception e) {
            System.out.println("Error fetching customer list.");
            e.printStackTrace();
        }

        return userList;
    }

    /**
     * Returns a list of all products, each formatted as "pid:pname:pdesc:pprice:pimg".
     */
    public static List<String> fetchProductsInfo() {
        String sql = "SELECT pid, pname, pdesc, pprice, pimg FROM products";
        List<String> productList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                String row = rs.getString(1) + ":"
                           + rs.getString(2) + ":"
                           + rs.getString(3) + ":"
                           + rs.getString(4) + ":"
                           + rs.getString(5);
                productList.add(row);
            }

        } catch (Exception e) {
            System.out.println("Error fetching product list.");
            e.printStackTrace();
        }

        return productList;
    }

    /**
     * Fetches a single product by its ID. Returns null if not found.
     */
    public static Product getProductById(int pid) {
        String sql = "SELECT pname, pprice, pimg FROM products WHERE pid = ?";
        Product product = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, pid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String pname  = rs.getString(1);
                    int    pprice = rs.getInt(2);
                    String pimg   = rs.getString(3);
                    product = new Product(pid, pname, pprice, pimg);
                }
            }

        } catch (Exception e) {
            System.out.println("Error fetching product with id: " + pid);
            e.printStackTrace();
        }

        return product;
    }

    /**
     * Returns the email address of a given username.
     * Returns an empty string if not found.
     */
    public static String mail(String name) {
        String sql = "SELECT mail FROM customers WHERE uname = ?";
        String mail = "";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    mail = rs.getString(1);
                }
            }

        } catch (Exception e) {
            System.out.println("Error fetching mail for user: " + name);
            e.printStackTrace();
        }

        return mail;
    }
}
