package controller; /**
 * Project: Product Discount Calculator
 * Package: ${PACKAGE_NAME}
 * User: lomahs
 * Date time: 08/08/2021 08:08
 * Created with IntelliJ IDEA
 */

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/DiscountServlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        float discount = Float.parseFloat(request.getParameter("discount"));

        float discountAmt = (float) (price * discount * 0.01);
        float realPrice = price - discountAmt;

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<h2>" + product + "</h2>");
        out.println("<h5> Discount Amount: " + discountAmt + "</h5>");
        out.println("<h5> Total price: " + realPrice + "</h5>");
        out.println("<html>");
    }
}
