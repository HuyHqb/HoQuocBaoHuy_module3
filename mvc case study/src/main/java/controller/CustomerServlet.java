package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.customer.CustomerService;
import service.customer.CustomerTypeService;
import service.customer.impl.ICustomerService;
import service.customer.impl.ICustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    ICustomerTypeService customerTypeService = new CustomerTypeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "delete":
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> listCustomer = customerService.listCustomer();
        request.setAttribute("listCustomer", listCustomer);
        List<CustomerType> listCustomerType = customerTypeService.findAll();
        request.setAttribute("listCustomerType", listCustomerType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/customer/index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> listCustomerType = customerTypeService.findAll();
        request.setAttribute("listCustomerType", listCustomerType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/customer/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
        }
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean check = customerService.deleteCustomer(id);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful!";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        boolean valid = true;
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        CustomerType customerType = new CustomerType(customerTypeId);
        Customer customer = new Customer(name, birthday,gender , idCard, phoneNumber, email, address,customerType);
        boolean check = customerService.addCustomer(customer);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request, response);
    }
}
