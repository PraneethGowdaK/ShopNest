package com.shopNest.dbHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Handles all INSERT, UPDATE, DELETE operations against the database.
 * Every method uses try-with-resources so connections are always closed.
 */
public class DataInjector {

    // Utility class — no instances needed
    private DataInjector() {}

    /**
     * Inserts a new customer into the database.
     * The password is hashed with SHA-256 before storing — never plain text.
     * Returns "success" or "fail".
     */
    public static String addCustomer(String name, String mail, String pass,
                                     String gender, String address) {
        String sql = "INSERT INTO customers VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, mail);
            ps.setString(3, PasswordUtil.hash(pass));  // hash before storing
            ps.setString(4, gender);
            ps.setString(5, address);
            ps.executeUpdate();
            return "success";

        } catch (Exception e) {
            System.out.println("Error adding customer: " + name);
            e.printStackTrace();
            return "fail";
        }
    }

    /**
     * Inserts a new product into the products table.
     * Returns true on success, false on failure.
     */
    public static boolean addProduct(int pid, String pname, String pdesc,
                                     int pprice, String pimg) {
        String sql = "INSERT INTO products VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, pid);
            ps.setString(2, pname);
            ps.setString(3, pdesc);
            ps.setInt(4, pprice);
            ps.setString(5, pimg);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error adding product: " + pname);
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates the password for the account with the given email.
     * The new password is hashed before storing.
     */
    public static void updatePassword(String mail, String newPass) {
        String sql = "UPDATE customers SET pass = ? WHERE mail = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, PasswordUtil.hash(newPass));  // hash before storing
            ps.setString(2, mail);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error updating password for mail: " + mail);
            e.printStackTrace();
        }
    }

    /**
     * Deletes a product from the products table by its ID.
     */
    public static void removeProduct(int id) {
        String sql = "DELETE FROM products WHERE pid = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error removing product with id: " + id);
            e.printStackTrace();
        }
    }
}
