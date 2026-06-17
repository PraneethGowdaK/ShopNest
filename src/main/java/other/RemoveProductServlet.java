package other;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopNest.dbHandler.DataInjector;
import com.shopNest.product.Cart;

@WebServlet("/rem")
public class RemoveProductServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // Must be logged in to remove anything
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String idParam = req.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam.trim());
        } catch (NumberFormatException e) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        if ("admin".equals(role)) {
            // Admin removes a product from the store entirely
            DataInjector.removeProduct(id);
            resp.sendRedirect("admin.jsp");
        } else {
            // Regular user removes an item from their own cart
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                cart.removeItem(id);
            }
            resp.sendRedirect("cart.jsp");
        }
    }
}
