package controller;

import bean.DichVuDiKem;
import bean.TiecCuoi;
import service.Service;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TiecCuoiServlet extends HttpServlet {
    Service service = new Service();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "remove":
                xoaTiecCuoi(request, response);
                break;
            default:
                showList(request, response);
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
            case "add":
                addTiecCuoi(request, response);
                break;
            case "edit":
                suaThongTinTiecCuoi(request, response);
                break;
            case "remove":

                break;
            default:
                break;
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TiecCuoi> list = service.xemCacTiecCuoi();

        request.setAttribute("danhSachTiec", list);
        request.getRequestDispatcher("listtieccuoi.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<DichVuDiKem> list = service.layDanhSachDichVu();

        request.setAttribute("danhSachDichVu", list);

        request.getRequestDispatcher("themtieccuoi.jsp").forward(request, response);
    }

    private void addTiecCuoi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Date ngayToChuc = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayToChuc"));
            String tenCoDau = request.getParameter("tenCoDau");
            String tenChuRe = request.getParameter("tenChuRe");
            int soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));
            int donGia = Integer.parseInt(request.getParameter("donGia"));
            int idDichVuDiKem = Integer.parseInt(request.getParameter("dichVuDiKem"));
            int tienNoDatCoc = Integer.parseInt(request.getParameter("tienNoDatCoc"));
            int tienNoThanhToan = Integer.parseInt(request.getParameter("tienNoThanhToan"));
            Date ngayDatCoc = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayDatCoc"));
            Date ngayThanhToan = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayThanhToan"));
            String ghiChu = request.getParameter("ghiChu");
            String trangThai = request.getParameter("trangThai");

            service.datTiecCuoi(ngayToChuc,
                    tenCoDau,
                    tenChuRe,
                    soLuongBan,
                    donGia,
                    idDichVuDiKem,
                    tienNoDatCoc,
                    tienNoThanhToan,
                    ngayDatCoc,
                    ngayThanhToan,
                    ghiChu,
                    trangThai);

            request.setAttribute("message", "Đặt thành công!");
            request.getRequestDispatcher("themtieccuoi.jsp").forward(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        TiecCuoi tiecCuoi = service.layThongTinTiecCuoi(id);
        request.setAttribute("tiecCuoi", tiecCuoi);

        List<DichVuDiKem> list = service.layDanhSachDichVu();
        request.setAttribute("danhSachDichVu", list);

        request.getRequestDispatcher("suatieccuoi.jsp").forward(request, response);
    }

    private void suaThongTinTiecCuoi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Date ngayToChuc = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayToChuc"));
            String tenCoDau = request.getParameter("tenCoDau");
            String tenChuRe = request.getParameter("tenChuRe");
            int soLuongBan = Integer.parseInt(request.getParameter("soLuongBan"));
            int donGia = Integer.parseInt(request.getParameter("donGia"));
            int idDichVuDiKem = Integer.parseInt(request.getParameter("dichVuDiKem"));
            int tienNoDatCoc = Integer.parseInt(request.getParameter("tienNoDatCoc"));
            int tienNoThanhToan = Integer.parseInt(request.getParameter("tienNoThanhToan"));
            Date ngayDatCoc = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayDatCoc"));
            Date ngayThanhToan = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngayThanhToan"));
            String ghiChu = request.getParameter("ghiChu");
            String trangThai = request.getParameter("trangThai");

            service.suaTiecCuoi(id,
                    ngayToChuc,
                    tenCoDau,
                    tenChuRe,
                    soLuongBan,
                    donGia,
                    idDichVuDiKem,
                    tienNoDatCoc,
                    tienNoThanhToan,
                    ngayDatCoc,
                    ngayThanhToan,
                    ghiChu,
                    trangThai);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        TiecCuoi tiecCuoi = service.layThongTinTiecCuoi(id);
        request.setAttribute("tiecCuoi", tiecCuoi);

        List<DichVuDiKem> list = service.layDanhSachDichVu();
        request.setAttribute("danhSachDichVu", list);

        request.setAttribute("message", "Sửa thành công!");

        request.getRequestDispatcher("suatieccuoi.jsp").forward(request, response);
    }


    private void xoaTiecCuoi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        service.xoaTiecCuoi(id);

        request.setAttribute("message", "Xoá Thành Công!");
        showList(request, response);
    }

}
