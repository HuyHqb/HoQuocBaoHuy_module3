package repository;

import bean.DichVuDiKem;
import bean.TiecCuoi;
import util.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class Repository implements IRepository {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public void datTiecCuoi(Date ngayToChuc,
                            String tenCoDau,
                            String tenChuRe,
                            int soLuongBan,
                            int donGia,
                            int dichVuDiKem,
                            int tienNoDatCoc,
                            int tienNoThanhToan,
                            Date ngayDatCoc,
                            Date ngayThanhToan,
                            String ghiChu,
                            String trangThai) {
        String INSERT_TIECCUOI = "INSERT INTO ThongTinTiecCuoi (ngayToChuc, " +
                "tenCoDau, " +
                "tenChuRe, " +
                "soLuongBan, " +
                "donGia, " +
                "dichVuDiKem, " +
                "tienNoDatCoc, " +
                "tienNoThanhToan, " +
                "ngayDatCoc, " +
                "ngayThanhToan, " +
                "ghiChu, " +
                "trangThai) VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(INSERT_TIECCUOI);

            pstmt.setDate(1, new java.sql.Date(ngayToChuc.getTime()));
            pstmt.setString(2, tenCoDau);
            pstmt.setString(3, tenChuRe);
            pstmt.setInt(4, soLuongBan);
            pstmt.setInt(5, donGia);
            pstmt.setInt(6, dichVuDiKem);
            pstmt.setInt(7, tienNoDatCoc);
            pstmt.setInt(8, tienNoThanhToan);
            pstmt.setDate(9, new java.sql.Date(ngayDatCoc.getTime()));
            pstmt.setDate(10, new java.sql.Date(ngayThanhToan.getTime()));
            pstmt.setString(11, ghiChu);
            pstmt.setString(12, trangThai);

            pstmt.executeUpdate();
            System.out.println(pstmt);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<TiecCuoi> xemCacTiecCuoi() {
        List<TiecCuoi> list = new ArrayList<>();

        String SELECT_ALL_TIECCUOI = "SELECT TT.id,\n" +
                "       TT.ngayToChuc,\n" +
                "       TT.tenCoDau,\n" +
                "       TT.tenChuRe,\n" +
                "       TT.soLuongBan,\n" +
                "       TT.donGia,\n" +
                "       DV.idDichVu,\n" +
                "       DV.tenDichVu,\n" +
                "       DV.donGia,\n" +
                "       TT.tienNoDatCoc,\n" +
                "       TT.tienNoThanhToan,\n" +
                "       TT.ngayDatCoc,\n" +
                "       TT.ngayThanhToan,\n" +
                "       TT.ghiChu,\n" +
                "       TT.trangThai\n" +
                "FROM ThongTinTiecCuoi TT JOIN DichVu DV ON DV.idDichVu = TT.dichVuDiKem;";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_TIECCUOI);
            rs = pstmt.executeQuery();

            System.out.println(pstmt);

            while (rs.next()) {
                list.add(new TiecCuoi(
                        rs.getInt(1),
                        new Date(rs.getDate(2).getTime()),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        new Date(rs.getDate(12).getTime()),
                        new Date(rs.getDate(13).getTime()),
                        rs.getString(14),
                        rs.getString(15)
                ));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public void suaTiecCuoi(int idTiecCanSua, Date ngayToChuc, String tenCoDau, String tenChuRe, int soLuongBan, int donGia, int dichVuDiKem, int tienNoDatCoc, int tienNoThanhToan, Date ngayDatCoc, Date ngayThanhToan, String ghiChu, String trangThai) {
        String UPDATE_TIECCUOI = "UPDATE ThongTinTiecCuoi " +
                "SET ngayToChuc = ?, " +
                "tenCoDau = ?," +
                "tenChuRe = ?," +
                "soLuongBan = ?," +
                "donGia = ?," +
                "dichVuDiKem = ?," +
                "tienNoDatCoc = ?," +
                "tienNoThanhToan = ?," +
                "ngayDatCoc = ?," +
                "ngayThanhToan = ?," +
                "ghiChu = ?," +
                "trangThai = ?" +
                " WHERE id = ?;";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(UPDATE_TIECCUOI);

            pstmt.setInt(13, idTiecCanSua);
            pstmt.setDate(1, new java.sql.Date(ngayToChuc.getTime()));
            pstmt.setString(2, tenCoDau);
            pstmt.setString(3, tenChuRe);
            pstmt.setInt(4, soLuongBan);
            pstmt.setInt(5, donGia);
            pstmt.setInt(6, dichVuDiKem);
            pstmt.setInt(7, tienNoDatCoc);
            pstmt.setInt(8, tienNoThanhToan);
            pstmt.setDate(9, new java.sql.Date(ngayDatCoc.getTime()));
            pstmt.setDate(10, new java.sql.Date(ngayThanhToan.getTime()));
            pstmt.setString(11, ghiChu);
            pstmt.setString(12, trangThai);

            pstmt.executeUpdate();

            System.out.println(pstmt);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void xoaTiecCuoi(int id) {
        String DELETE_TIECCUOI = "DELETE FROM ThongTinTiecCuoi WHERE id = ?;";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(DELETE_TIECCUOI);
            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            System.out.println(pstmt);
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    public List<DichVuDiKem> layDanhSachDichVu() {
        List<DichVuDiKem> list = new ArrayList<>();

        String SELECT_ALL_DICHVU = "SELECT * FROM DichVu";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_DICHVU);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new DichVuDiKem(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3)
                ));
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    public DichVuDiKem layThongTinDichVu(int id) {
        DichVuDiKem dv = new DichVuDiKem(id);

        String SELECT_DICHVU = "SELECT * FROM DichVu WHERE idDichVu = ?;";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(SELECT_DICHVU);
            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dv.setTenDichVu(rs.getString(2));
                dv.setDonGia(rs.getInt(3));
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return dv;
    }

    @Override
    public TiecCuoi layThongTinTiecCuoi(int id) {
        String SELECT_TIECCUOI = "SELECT TT.id,\n" +
                "       TT.ngayToChuc,\n" +
                "       TT.tenCoDau,\n" +
                "       TT.tenChuRe,\n" +
                "       TT.soLuongBan,\n" +
                "       TT.donGia,\n" +
                "       DV.idDichVu,\n" +
                "       DV.tenDichVu,\n" +
                "       DV.donGia,\n" +
                "       TT.tienNoDatCoc,\n" +
                "       TT.tienNoThanhToan,\n" +
                "       TT.ngayDatCoc,\n" +
                "       TT.ngayThanhToan,\n" +
                "       TT.ghiChu,\n" +
                "       TT.trangThai\n" +
                "FROM ThongTinTiecCuoi TT JOIN DichVu DV ON DV.idDichVu = TT.dichVuDiKem \n" +
                "WHERE id = ?";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(SELECT_TIECCUOI);
            pstmt.setInt(1, id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                return new TiecCuoi(
                        rs.getInt(1),
                        new Date(rs.getDate(2).getTime()),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        new Date(rs.getDate(12).getTime()),
                        new Date(rs.getDate(13).getTime()),
                        rs.getString(14),
                        rs.getString(15)
                );
            }

            System.out.println(pstmt);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }
}
