package com.shopNest.dbHandler;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Simple password hashing using SHA-256.
 * Passwords are never stored as plain text.
 */
public class PasswordUtil {

    private PasswordUtil() {}

    /**
     * Hashes a plain-text password using SHA-256 and returns a hex string.
     */
    public static String hash(String plainPassword) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashed = md.digest(plainPassword.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashed) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            // SHA-256 is always available in Java — this should never happen
            throw new RuntimeException("SHA-256 algorithm not found", e);
        }
    }

    /**
     * Checks a plain-text password against a stored hash.
     */
    public static boolean matches(String plainPassword, String storedHash) {
        return hash(plainPassword).equals(storedHash);
    }
}
