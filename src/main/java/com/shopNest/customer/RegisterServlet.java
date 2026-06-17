package com.shopNest.customer;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopNest.dbHandler.DataInjector;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String name    = req.getParameter("name");
        String mail    = req.getParameter("mail");
        String pass    = req.getParameter("pass");
        String gender  = req.getParameter("gender");
        String address = req.getParameter("address");

        // Basic null/empty check before hitting the database
        if (name == null || name.isEmpty() ||
            mail == null || mail.isEmpty() ||
            pass == null || pass.isEmpty()) {
            resp.sendRedirect("register.jsp?error=empty");
            return;
        }

        String status = DataInjector.addCustomer(name, mail, pass, gender, address);

        if ("success".equals(status)) {
            resp.sendRedirect("login.jsp?registered=true");
        } else {
            resp.sendRedirect("register.jsp?error=fail");
        }
    }
}
