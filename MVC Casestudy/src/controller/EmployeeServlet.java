package controller;

import bean.employee.Employee;
import service.IEmployeeSvc;
import service.impl.EmployeeSvc;
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

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeSvc service = new EmployeeSvc();

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
                showListEmployee(request, response);
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
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "showEditForm":
                showEditForm(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                break;
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> list = service.readAllEmployees();

        request.setAttribute("listEmployee", list);
        request.getRequestDispatcher("employee/list-employee.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("employee/add-employee.jsp").forward(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            System.out.println(e.getMessage());
        }
        String idCard = request.getParameter("idCard");
        String salary = request.getParameter("salary");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegree"));
        int divisionID = Integer.parseInt(request.getParameter("division"));

        if (name.isEmpty()) {
            isValid = false;
            request.setAttribute("errorName", "Please enter name");
        }

        if (!validate.isValidIdCard(idCard)) {
            isValid = false;
            request.setAttribute("errorIdCard", "ID Card must have 9 or 12 digits");
        }

        if (!validate.isPositiveDouble(salary)) {
            isValid = false;
            request.setAttribute("errorSalary", "Please enter positive number");
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
            int id = service.addEmployee(
                    name,
                    birthday,
                    idCard,
                    Double.parseDouble(salary),
                    phone,
                    email,
                    address,
                    positionId,
                    educationDegreeId,
                    divisionID,
                    validate.getUsernameFromEmail(email)
            );

            request.setAttribute("newEmployeeId", id);
            showListEmployee(request, response);
        } else {
            request.setAttribute("birthday", new SimpleDateFormat("yyyy-MM-dd").format(birthday));
            request.setAttribute("name", name);
            request.setAttribute("idCard", idCard);
            request.setAttribute("salary", salary);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("position", positionId);
            request.setAttribute("educationDegree", educationDegreeId);
            request.setAttribute("division", divisionID);

            request.getRequestDispatcher("employee/add-employee.jsp").forward(request, response);
        }


    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = service.getEmployeeById(id);

        request.setAttribute("id", id);
        request.setAttribute("birthday", employee.getBirthdayForInput());
        request.setAttribute("name", employee.getName());
        request.setAttribute("idCard", employee.getIdCard());
        request.setAttribute("salary", employee.getSalary());
        request.setAttribute("phone", employee.getPhone());
        request.setAttribute("email", employee.getEmail());
        request.setAttribute("address", employee.getAddress());
        request.setAttribute("position", employee.getPosition().getId());
        request.setAttribute("educationDegree", employee.getEducationDegree().getId());
        request.setAttribute("division", employee.getDivision().getId());
        request.setAttribute("username", employee.getUser().getUsername());

        request.getRequestDispatcher("employee/edit-employee.jsp").forward(request, response);
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        String idCard = request.getParameter("idCard");
        String salary = request.getParameter("salary");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionID = Integer.parseInt(request.getParameter("position"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegree"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        String username = request.getParameter("username");

        if (name.isEmpty()) {
            isValid = false;
            request.setAttribute("errorName", "Please enter name");
        }

        if (!validate.isValidIdCard(idCard)) {
            isValid = false;
            request.setAttribute("errorIdCard", "ID Card must have 9 or 12 digits");
        }

        if (!validate.isPositiveDouble(salary)) {
            isValid = false;
            request.setAttribute("errorSalary", "Please enter positive number");
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
            service.updateEmployee(
                    id,
                    name,
                    birthday,
                    idCard,
                    Double.parseDouble(salary),
                    phone,
                    email,
                    address,
                    positionID,
                    educationDegreeId,
                    divisionId
            );
            request.setAttribute("message", "Edit Successfully!");
            showEditForm(request, response);
        } else {
            request.setAttribute("id", id);
            request.setAttribute("birthday", new SimpleDateFormat("yyyy-MM-dd").format(birthday));
            request.setAttribute("name", name);
            request.setAttribute("idCard", idCard);
            request.setAttribute("salary", salary);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("position", positionID);
            request.setAttribute("educationDegree", educationDegreeId);
            request.setAttribute("division", divisionId);
            request.setAttribute("username", username);

            request.getRequestDispatcher("employee/edit-employee.jsp").forward(request, response);
        }


    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        service.deleteEmployee(id);
        request.setAttribute("message", "Delete Successfully!");

        showListEmployee(request, response);
    }
}

