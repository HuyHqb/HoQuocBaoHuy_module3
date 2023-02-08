package controller; /**
 * Project: Tạo trang web hiển thị thời gian hệ thống
 * Package: ${PACKAGE_NAME}
 * User: lomahs
 * Date time: 07/08/2021 16:11
 * Created with IntelliJ IDEA
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class ServerTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        Date today = new Date();
        writer.println("<html>");
        writer.println("<h1>" + today + "</h1>");
        writer.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
