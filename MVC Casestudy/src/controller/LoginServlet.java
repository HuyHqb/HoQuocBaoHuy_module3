package controller;

import bean.employee.User;
import service.impl.EmployeeSvc;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                request.setAttribute("user", cookie.getValue());
            }
            if (cookie.getName().equals("password")) {
                request.setAttribute("pass", cookie.getValue());
            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (new EmployeeSvc().checkLogin(username, password)) {
            Cookie name = new Cookie("username", username);
            Cookie pass = new Cookie("password", password);

            boolean checkRemember = Boolean.parseBoolean(request.getParameter("checkRemember"));
            if (checkRemember) {
                name.setMaxAge(60 * 60 * 24);
                pass.setMaxAge(60 * 60 * 24);
            } else {
                name.setMaxAge(0);
                pass.setMaxAge(0);
            }

            response.addCookie(name);
            response.addCookie(pass);

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("username", new EmployeeSvc().getNameByUName(username));

            request.getRequestDispatcher("home").forward(request, response);
        } else {
            request.setAttribute("user", username);
            request.setAttribute("pass", password);

            request.setAttribute("error", "Please check your username or password again");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
