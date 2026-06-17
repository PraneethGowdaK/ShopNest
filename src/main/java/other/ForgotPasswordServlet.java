package other;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forgot")
public class ForgotPasswordServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String name  = req.getParameter("name");
        String mail  = req.getParameter("email");
        String npass = req.getParameter("newpass");
        String rpass = req.getParameter("repass");

        String status = PassValidator.password(name, mail, npass, rpass);

        // Use .equals() to compare strings — never ==
        if ("password changed successfully".equals(status)) {
            resp.sendRedirect("login.jsp?reset=true");

        } else if ("Password not matching".equals(status)) {
            resp.sendRedirect("ForgotPassword.jsp?error=mismatch");

        } else {
            resp.sendRedirect("ForgotPassword.jsp?error=email");
        }
    }
}
