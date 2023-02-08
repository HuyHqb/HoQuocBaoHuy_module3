package controller;

import bean.service.Service;
import service.IServiceSvc;
import service.impl.ServiceSvc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/service")
public class ServiceServlet extends HttpServlet {
    IServiceSvc serviceSvc = new ServiceSvc();

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
            case "edit":
                showEditForm(request, response);
                break;
            default:
                showListServices(request, response);
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
                createService(request, response);
                break;
            case "edit":
                editService(request, response);
                break;
            case "delete":
                deleteService(request, response);
                break;
            default:
                break;
        }
    }

    private void showListServices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> list = serviceSvc.readAllServices();

        request.setAttribute("listService", list);
        request.getRequestDispatcher("service/list-service.jsp").forward(request, response);
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int numberOfPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceType"));
        String standard = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));

        int id = serviceSvc.addService(name, area, cost, numberOfPeople, rentTypeId, serviceTypeId, standard, description, poolArea, numberOfFloors);

        request.setAttribute("newServiceId", id);
        request.setAttribute("message", "Add Successfully!");
        showListServices(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("service/add-service.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Service service = serviceSvc.getServiceById(id);

        request.setAttribute("service", service);
        request.getRequestDispatcher("service/edit-service.jsp").forward(request, response);
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int numberOfPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentType"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceType"));
        String standard = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));

        serviceSvc.updateService(id, name, area, cost, numberOfPeople, rentTypeId, serviceTypeId, standard, description, poolArea, numberOfFloors);

        Service service = serviceSvc.getServiceById(id);
        request.setAttribute("service", service);
        request.setAttribute("message", "Edit Successfully!");

        request.getRequestDispatcher("service/edit-service.jsp").forward(request, response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        serviceSvc.deleteService(id);

        showListServices(request, response);
    }
}
