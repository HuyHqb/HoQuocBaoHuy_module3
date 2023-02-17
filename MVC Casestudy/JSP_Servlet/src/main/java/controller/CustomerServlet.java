package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;
import service.Employee.IEmployeeSvc;
import service.Employee.EmployeeSvc;
import service.customer.CustomerSvc;
import service.customer.CustomerTypeSvc;
import service.customer.ICustomerSvc;
import service.customer.ICustomerTypeSvc;
import utils.Validator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerSvc customerSvc = new CustomerSvc();
    ICustomerTypeSvc customerTypeSvc = new CustomerTypeSvc();
    Validator validate = new Validator();

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

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> listCustomerType = customerTypeSvc.findAll();
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

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> listCustomer = customerSvc.listCustomer();
        request.setAttribute("listCustomer", listCustomer);
        List<CustomerType> listCustomerType = customerTypeSvc.findAll();
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
        boolean check = customerSvc.deleteCustomer(id);
        String mess = "Xoá thành công";
        if (!check) {
            mess = "Xoá thất bại";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        boolean valid = true;
        int customerTypeId = Integer.parseInt(request.getParameter("customertype_id"));
        CustomerType customerType = new CustomerType(customerTypeId);
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int sex = Integer.parseInt(request.getParameter("sex"));
        String cardId = request.getParameter("cardid");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerType,name, birthday,sex , cardId, phoneNumber, email, address);
        boolean check = customerSvc.addCustomer(customer);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request, response);
    }
}
