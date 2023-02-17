package controller;

import model.svc.RentType;
import model.svc.Service;
import model.svc.ServiceType;
import service.svc.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/service")
public class ServiceServlet extends HttpServlet {
    private IServiceSvc serviceSvc = new ServiceSvc();
    private IServiceTypeSvc serviceTypeSvc = new ServiceTypeSvc();
    private IRentTypeSvc rentTypeSvc = new RentTypeSvc();

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
        List<RentType> listRentType = rentTypeSvc.findAll();
        request.setAttribute("listRentType", listRentType);
        List<ServiceType> listServiceType = serviceTypeSvc.findAll();
        request.setAttribute("listServiceType", listServiceType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/service/index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Service> listService = serviceSvc.listService();
        request.setAttribute("listService", listService);
/*        List<RentType> listRentType = rentTypeSvc.findAll();
        request.setAttribute("listRentType", listRentType);
        List<ServiceType> listServiceType = serviceTypeSvc.findAll();
        request.setAttribute("listServiceType", listServiceType);*/
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/service/index.jsp");
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
//                delete(request, response);
                break;
            default:
                break;
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
//        String name = request.getParameter("name");
//        String birthday = request.getParameter("birthday");
//        int sex = Integer.parseInt(request.getParameter("sex"));
//        float point = Float.parseFloat(request.getParameter("point"));
//        int classId = Integer.parseInt(request.getParameter("classId"));
//        Clazz clazz = new Clazz(classId);
//        Student student = new Student(name, gender, point, clazz);
//        boolean check = studentService.add(student);
//        String mess = "Thêm mới thành công";
//        if (!check) {
//            mess = "Thêm mới không thành công";
//        }
//        request.setAttribute("mess", mess);
//        showFormCreate(request, response);
    }
}
