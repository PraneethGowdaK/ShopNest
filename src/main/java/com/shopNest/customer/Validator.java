package com.shopNest.customer;

import com.shopNest.dbHandler.DataFetcher;
import com.shopNest.dbHandler.PasswordUtil;

/**
 * Validates login credentials against the database.
 * The incoming password is hashed and compared to the stored hash.
 */
public class Validator {

    private Validator() {}

    /**
     * Returns true if the username and password match a record in the DB.
     */
    public static boolean isValid(String name, String pass) {
        if (name == null || name.isEmpty() || pass == null || pass.isEmpty()) {
            return false;
        }
        String storedHash = DataFetcher.fetchPassword(name);
        return PasswordUtil.matches(pass, storedHash);
    }
}
