package com.shopNest.admin;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopNest.dbHandler.DataInjector;

@WebServlet("/addP")
public class ProductServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // Only admin can add products
        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String pidParam    = req.getParameter("product-id");
        String pname       = req.getParameter("product-name");
        String pdesc       = req.getParameter("product-description");
        String priceParam  = req.getParameter("product-price");
        String pimg        = req.getParameter("product-image");

        // Validate required fields
        if (pidParam == null || pidParam.isEmpty() ||
            pname    == null || pname.isEmpty()    ||
            priceParam == null || priceParam.isEmpty()) {
            resp.sendRedirect("admin.jsp?error=empty");
            return;
        }

        int pid, pprice;
        try {
            pid    = Integer.parseInt(pidParam.trim());
            pprice = Integer.parseInt(priceParam.trim());
        } catch (NumberFormatException e) {
            // ID or price was not a valid number
            resp.sendRedirect("admin.jsp?error=invalid");
            return;
        }

        DataInjector.addProduct(pid, pname, pdesc, pprice, pimg);
        resp.sendRedirect("admin.jsp");
    }
}
