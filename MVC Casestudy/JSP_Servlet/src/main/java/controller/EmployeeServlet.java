package controller;

import model.employee.Employee;
import model.employee.Level;
import model.employee.Position;
import model.employee.WorkPart;
import service.Employee.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

//import static org.graalvm.compiler.nodeinfo.Verbosity.Id;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeSvc employeeSvc = new EmployeeSvc();
    IWorkPartSvc workPartSvc = new WorkPartSvc();
    IPositionSvc positionSvc = new PositionSvc();
    ILevelSvc levelSvc = new LevelSvc();

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
        List<WorkPart> listWorkPart = workPartSvc.findAll();
        request.setAttribute("listWorkPart",listWorkPart);
        List<Position> listPosition = positionSvc.findAll();
        request.setAttribute("listPosition",listPosition);
        List<Level> listLevel = levelSvc.findAll();
        request.setAttribute("listLevel",listLevel);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> listEmployee = employeeSvc.listEmployee();
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
        boolean check = employeeSvc.deleteEmployee(id);
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
        String cardId = request.getParameter("cardid");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position_id"));
        Position position = new Position(positionId);
        int levelId = Integer.parseInt(request.getParameter("level_id"));
        Level level = new Level(levelId);
        int workPartId = Integer.parseInt(request.getParameter("workpart_id"));
        WorkPart workPart = new WorkPart(workPartId);
        Employee employee = new Employee(name,birthday,cardId,salary,phoneNumber,email,address,position,level,workPart);
        boolean check = employeeSvc.addEmployee(employee);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request, response);
    }
}
