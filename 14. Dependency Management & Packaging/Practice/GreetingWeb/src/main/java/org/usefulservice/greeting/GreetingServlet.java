package org.usefulservice.greeting;

import org.usefullibs.greeter.Greeter;
import org.usefullibs.greeter.impl.HelloWorld;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "greeting", urlPatterns = "/greeting")
public class GreetingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Greeter greeter = new HelloWorld();
        String message = greeter.greet();
        response.getOutputStream().print(message);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
