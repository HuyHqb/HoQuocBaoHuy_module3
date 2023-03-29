package controller;

import model.*;

import service.hinhThucThanhToan.HinhThucThanhToanService;
import service.hinhThucThanhToan.IHinhThucThanhToanService;
import service.phongTro.IPhongTroService;
import service.phongTro.PhongTroService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrangChuController", value = "/phongTro")
public class PhongTroController extends HttpServlet {
    IPhongTroService phongTroService = new PhongTroService();
    IHinhThucThanhToanService hinhThucThanhToanService = new HinhThucThanhToanService();

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
            case "update":
                showUpdateForm(request, response);
                break;
            default:
                listPhongTro(request, response);
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PhongTro phongTro = phongTroService.findById(Integer.parseInt("id"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        request.setAttribute("phongTro", phongTro);
        dispatcher.forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HinhThucThanhToan> hinhThucThanhToanList = hinhThucThanhToanService.findAll();
        request.setAttribute("hinhThucThanhToanList",hinhThucThanhToanList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listPhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HinhThucThanhToan> hinhThucThanhToanList = hinhThucThanhToanService.findAll();
        request.setAttribute("hinhThucThanhToanList",hinhThucThanhToanList);
        List<PhongTro> phongTroList = phongTroService.findAll();
        request.setAttribute("phongTroList", phongTroList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request,response);
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
            case "update":
                update(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                listPhongTro(request, response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean valid = true;
        String tenNguoiThue = request.getParameter("tenNguoiThue");
        String soDienThoai = request.getParameter("soDienThoai");
        String ngayBatDau = request.getParameter("ngayBatDau");
        String idCard = request.getParameter("idCard");
        int maHinhThucThanhToan = Integer.parseInt(request.getParameter("maHinhThucThanhToan"));
        HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(maHinhThucThanhToan);
        String ghiChu = request.getParameter("ghiChu");

        PhongTro phongTro = new PhongTro(tenNguoiThue, soDienThoai,ngayBatDau ,hinhThucThanhToan, ghiChu);
        boolean check = phongTroService.add(phongTro);
        String mess = "Successful";
        if (!check) {
            mess = "Unsuccessful";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameSearch = request.getParameter("nameSearch");
        String sdtSearch   = request.getParameter("sdtSearch");
        List<PhongTro> phongTroList = phongTroService.search(nameSearch,sdtSearch);
        request.setAttribute("phongTroList",phongTroList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        phongTroService.delete(id);
        listPhongTro(request, response);
    }
}
