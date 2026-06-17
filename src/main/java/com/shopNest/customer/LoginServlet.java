package com.shopNest.customer;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopNest.product.Cart;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String name = req.getParameter("name");
        String pass = req.getParameter("pass");

        // Guard against empty fields — use .isEmpty(), not ==
        if (name == null || name.isEmpty() || pass == null || pass.isEmpty()) {
            resp.sendRedirect("login.jsp?error=empty");
            return;
        }

        boolean valid = Validator.isValid(name, pass);

        if (valid && "admin".equals(name)) {
            // Admin gets their own session — no cart needed
            HttpSession session = req.getSession(true);
            session.setAttribute("username", name);
            session.setAttribute("role", "admin");
            resp.sendRedirect("admin.jsp");

        } else if (valid) {
            // Regular user — create session and initialise cart
            HttpSession session = req.getSession(true);
            session.setAttribute("username", name);
            session.setAttribute("role", "user");
            session.setAttribute("cart", new Cart());
            resp.sendRedirect("home.jsp");

        } else {
            resp.sendRedirect("login.jsp?error=invalid");
        }
    }
}
