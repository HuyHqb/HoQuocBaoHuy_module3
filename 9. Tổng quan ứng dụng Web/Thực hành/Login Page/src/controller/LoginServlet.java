package controller; /**
 * Project: Login Page
 * Package: ${PACKAGE_NAME}
 * User: lomahs
 * Date time: 07/08/2021 16:44
 * Created with IntelliJ IDEA
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String pass = request.getParameter("password");

        PrintWriter out = response.getWriter();
        out.println("<html>");

        if (name.equals("admin") && pass.equals("admin")){
            out.println("<h1> Hello " + name + "</h1>");
        }else {
            out.println("<h1> Login error </h1>");
        }

        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
