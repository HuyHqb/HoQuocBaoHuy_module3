package controller;

import bean.Employee;
import bean.Job;
import service.EmployeeService;
import service.JobService;
import service.impl.IEmployeeService;
import service.impl.IJobService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.text.Position;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    IJobService jobService = new JobService();

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
            case "update":
                showFormUpdate(request,response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("update.jsp");
        List<Job> jobList = jobService.findAll();
        request.setAttribute("jobList", jobList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        List<Job> jobList = jobService.findAll();
        request.setAttribute("jobList", jobList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        List<Job> jobList = jobService.findAll();
        request.setAttribute("jobList", jobList);
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
            case "search":
                search(request,response);
            default:
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jobNameSearch = request.getParameter("jobNameSearch");
        float minSalary = Float.parseFloat(request.getParameter("minSalary"));
        float maxSalary = Float.parseFloat(request.getParameter("maxSalary"));
        List<Employee> employeeList = employeeService.search(jobNameSearch, minSalary, maxSalary);
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {

    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fullName");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        String startDay = request.getParameter("startDay");
        String endDay = request.getParameter("endDay");
        float salary = Float.parseFloat((request.getParameter("salary")));
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        Job job = new Job(jobId);
        Employee employee = new Employee(fullName, birthday, address, startDay, endDay, salary, job);
        boolean check = employeeService.add(employee);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request, response);
    }
}
