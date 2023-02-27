package controller;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.employee.impl.IEducationDegreeRepo;
import service.employee.DivisionService;
import service.employee.EducationDegreeService;
import service.employee.EmployeeService;
import service.employee.PositionService;
import service.employee.impl.IDivisionService;
import service.employee.impl.IEducationDegreeService;
import service.employee.impl.IEmployeeService;
import service.employee.impl.IPositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    IDivisionService divisionService = new DivisionService();
    IPositionService positionService = new PositionService();
    IEducationDegreeService educationDegreeService = new EducationDegreeService();

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
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/employee/create.jsp");
        List<Division> listDivision = divisionService.findAll();
        request.setAttribute("listDivision",listDivision);
        List<Position> listPosition = positionService.findAll();
        request.setAttribute("listPosition",listPosition);
        List<EducationDegree> listEducationDegree = educationDegreeService.findAll();
        request.setAttribute("listEducationDegree",listEducationDegree);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> listEmployee = employeeService.listEmployee();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/employee/index.jsp");
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
        boolean check = employeeService.deleteEmployee(id);
        String mess = "Xoá thành công";
        if (!check) {
            mess = "Xoá thất bại";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String cardId = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        Position position = new Position(positionId);
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegree"));
        EducationDegree educationDegree = new EducationDegree(educationDegreeId);
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Division division = new Division(divisionId);
        Employee employee = new Employee(name,birthday,cardId,salary,phoneNumber,email,address,position,educationDegree,division);
        boolean check = employeeService.addEmployee(employee);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request, response);
    }
}
