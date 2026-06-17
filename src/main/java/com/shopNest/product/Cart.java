package com.shopNest.product;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Represents a shopping cart for one user.
 * Stored in the HTTP session so each user has their own separate cart.
 * Must be Serializable so Tomcat can persist sessions if needed.
 */
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;

    // Instance variable (NOT static) — each Cart object holds its own list
    private List<Product> items;

    public Cart() {
        items = new ArrayList<>();
    }

    /** Adds a product to this cart. */
    public void addItem(Product product) {
        if (product != null) {
            items.add(product);
        }
    }

    /** Removes a product from this cart by its ID. */
    public void removeItem(int pid) {
        items.removeIf(p -> p.getPid() == pid);
    }

    /** Returns the list of items in this cart. */
    public List<Product> getItems() {
        return items;
    }

    /** Calculates and returns the total price of all items in the cart. */
    public double getTotal() {
        double total = 0.0;
        for (Product item : items) {
            total += item.getPprice();
        }
        return total;
    }
}
