package controller;

import bean.customer.Customer;
import service.ICustomerSvc;
import service.impl.CustomerSvc;
import util.Validator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerSvc service = new CustomerSvc();
    Validator validate = new Validator();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            default:
                showListCustomers(request, response);
                break;
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
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "showEditForm":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                showListCustomers(request, response);
                break;
        }
    }

    private void showListCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> list = service.readAllCustomers();

        request.setAttribute("listCustomer", list);
        request.getRequestDispatcher("customer/list-customer.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("customer/add-customer.jsp").forward(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isValid = true;

        String name = request.getParameter("name");
        Date birthday = new Date();
        try {
            String birthdayString = request.getParameter("birthday");

            if (!birthdayString.isEmpty()) {
                birthday = new SimpleDateFormat("yyyy-MM-dd").parse(birthdayString);

                if (!validate.isValidBirthday(birthday)) {
                    isValid = false;
                    request.setAttribute("errorDate", "Birthday must before today");
                }
            } else {
                isValid = false;
                request.setAttribute("errorDate", "Please enter birthday");
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int typeId = Integer.parseInt(request.getParameter("type"));


        if (name.isEmpty()) {
            isValid = false;
            request.setAttribute("errorName", "Please enter name");
        }

        if (!validate.isValidIdCard(idCard)) {
            isValid = false;
            request.setAttribute("errorIdCard", "ID Card must have 9 or 12 digits");
        }

        if (!validate.isValidPhone(phone)) {
            isValid = false;
            request.setAttribute("errorPhone", "Phone number format 090 xxxx xxx, 091 xxxx xxx or 8490 xxxx xxx, 8491 xxxx xxx");
        }

        if (!validate.isValidEmail(email)) {
            isValid = false;
            request.setAttribute("errorEmail", "Please enter correct email (Ex: abc@mail.com)");
        }

        if (isValid) {
            int id = service.addCustomer(
                    typeId,
                    name,
                    birthday,
                    gender,
                    idCard,
                    phone,
                    email,
                    address
            );

            request.setAttribute("newCustomerId", id);
            showListCustomers(request, response);
        } else {
            request.setAttribute("birthday", new SimpleDateFormat("yyyy-MM-dd").format(birthday));
            request.setAttribute("name", name);
            request.setAttribute("idCard", idCard);
            request.setAttribute("isMale", gender);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("typeId", typeId);

            request.getRequestDispatcher("customer/add-customer.jsp").forward(request, response);
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = service.getCustomerById(id);

        request.setAttribute("id", id);
        request.setAttribute("birthday", customer.getBirthdayForInput());
        request.setAttribute("name", customer.getName());
        request.setAttribute("idCard", customer.getIdCard());
        request.setAttribute("isMale", customer.isMale());
        request.setAttribute("phone", customer.getPhone());
        request.setAttribute("email", customer.getEmail());
        request.setAttribute("address", customer.getAddress());
        request.setAttribute("typeId", customer.getCustomerType().getId());
        request.getRequestDispatcher("customer/edit-customer.jsp").forward(request, response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isValid = true;

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Date birthday = new Date();
        try {
            String birthdayString = request.getParameter("birthday");

            if (!birthdayString.isEmpty()) {
                birthday = new SimpleDateFormat("yyyy-MM-dd").parse(birthdayString);

                if (!validate.isValidBirthday(birthday)) {
                    isValid = false;
                    request.setAttribute("errorDate", "Birthday must before today");
                }
            } else {
                isValid = false;
                request.setAttribute("errorDate", "Please enter birthday");
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int typeId = Integer.parseInt(request.getParameter("type"));

        if (name.isEmpty()) {
            isValid = false;
            request.setAttribute("errorName", "Please enter name");
        }

        if (!validate.isValidIdCard(idCard)) {
            isValid = false;
            request.setAttribute("errorIdCard", "ID Card must have 9 or 12 digits");
        }

        if (!validate.isValidPhone(phone)) {
            isValid = false;
            request.setAttribute("errorPhone", "Phone number format 090 xxxx xxx, 091 xxxx xxx or 8490 xxxx xxx, 8491 xxxx xxx");
        }

        if (!validate.isValidEmail(email)) {
            isValid = false;
            request.setAttribute("errorEmail", "Please enter correct email (Ex: abc@mail.com)");
        }

        if (isValid) {
            service.updateCustomer(
                    id,
                    typeId,
                    name,
                    birthday,
                    gender,
                    idCard,
                    phone,
                    email,
                    address
            );

            request.setAttribute("message", "Edit Successfully!");
            showEditForm(request, response);
        } else {
            request.setAttribute("id", id);
            request.setAttribute("birthday", new SimpleDateFormat("yyyy-MM-dd").format(birthday));
            request.setAttribute("name", name);
            request.setAttribute("idCard", idCard);
            request.setAttribute("isMale", gender);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("typeId", typeId);

            request.getRequestDispatcher("customer/edit-customer.jsp").forward(request, response);
        }


    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        service.deleteCustomer(id);
        request.setAttribute("message", "Delete Successfully!");

        showListCustomers(request, response);
    }
}
