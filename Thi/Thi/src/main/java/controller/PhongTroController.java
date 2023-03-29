package controller;

import model.hinhThucThanhToan.HinhThucThanhToan;
import model.phongTro.PhongTro;
import service.phongTro.PhongTroService;
import service.phongTro.IPhongTroService;
import service.hinhThucThanhToan.HinhThucThanhToanService;
import service.hinhThucThanhToan.IHinhThucThanhToanService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TrangChuController", value = "/employee")
public class PhongTroController extends HttpServlet {
    IPhongTroService phongTroService = new PhongTroService();
    IHinhThucThanhToanService hinhThucThanhToanService = new HinhThucThanhToanService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "create" :
                showCreateForm(request,response);
                break;
            case "update":
//                showUpdateForm(request,response);
                break;
            default:
                listPhongTro(request,response);
        }
    }

//
//
    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HinhThucThanhToan> hinhThucThanhToanList = hinhThucThanhToanService.findAll();
        request.setAttribute("hinhThucThanhToanList",hinhThucThanhToanList);
        request.getRequestDispatcher("create.jsp").forward(request,response);
    }

    private void listPhongTro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PhongTro> phongTroList = phongTroService.findAll();
        request.setAttribute("phongTroList", phongTroList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }

        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            case "search":
                search(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                listPhongTro(request,response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenNguoiThue = request.getParameter("tenNguoiThue");
        String soDienThoai = request.getParameter("soDienThoai");
        String[] temp = request.getParameter("ngayBatDau").split("-");
        String ngayBatDau = null;
        try {
            ngayBatDau = String.join("-", temp[2], temp[1], temp[0]);
        } catch (Exception e) {
            e.printStackTrace();
        }
        HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(Integer.parseInt(request.getParameter("hinhThucThanhToanId")));
        String ghiChu = request.getParameter("ghiChu");
        PhongTro phongTro = new PhongTro(tenNguoiThue, soDienThoai, ngayBatDau,hinhThucThanhToan, ghiChu);
        phongTroService.add(phongTro);
        request.setAttribute("message", "Thêm mới thành công");
        showCreateForm(request,response);
    }
//
//
//
    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maPhongTro = request.getParameter("maPhongTro");
        String[] temp = maPhongTro.split("");
        String so;
        if (maPhongTro.equals("")) {
            so = "";
        } else {
            so = temp[5];
        }
        String tenNguoiThue = request.getParameter("tenNguoiThue");
        String soDienThoai = request.getParameter("soDienThoai");
        List<PhongTro> phongTroList = phongTroService.search(so, tenNguoiThue, soDienThoai);
        request.setAttribute("phongTroList", phongTroList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
//
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        phongTroService.delete(id);
        listPhongTro(request,response);
    }
}
