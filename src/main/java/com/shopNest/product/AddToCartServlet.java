package com.shopNest.product;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopNest.dbHandler.DataFetcher;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Make sure the user is logged in before doing anything
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String productIdParam = request.getParameter("productId");

        // Validate the productId param before parsing
        if (productIdParam == null || productIdParam.isEmpty()) {
            response.sendRedirect("home.jsp");
            return;
        }

        int productId;
        try {
            productId = Integer.parseInt(productIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("home.jsp");
            return;
        }

        Product product = DataFetcher.getProductById(productId);
        if (product == null) {
            // Product not found in DB — just go back home
            response.sendRedirect("home.jsp");
            return;
        }

        // Get the cart from the session (it was created at login)
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        cart.addItem(product);
        response.sendRedirect("cart.jsp");
    }
}
