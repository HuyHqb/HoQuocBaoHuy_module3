package repository.phongTro;

import repository.BaseRepository;
import model.HinhThucThanhToan;
import model.PhongTro;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhongTroRepo implements IPhongTroRepo {
    private final String SELECT_ALL = "select pt.ma_phong_tro,pt.ten_nguoi_thue,pt.sdt,pt.ngay_bat_dau,pt.ma_hinh_thuc_thanh_toan,httt.kieu_thue,pt.ghi_chu from phong_tro pt join hinh_thuc_thanh_toan httt on pt.ma_hinh_thuc_thanh_toan = httt.ma_hinh_thuc_thanh_toan;";
    private final String SELECT_BY_ID = "select pt.ma_phong_tro,pt.ten_nguoi_thue,pt.sdt,pt.ngay_bat_dau,pt.ma_hinh_thuc_thanh_toan,httt.kieu_thue,pt.ghi_chu from phong_tro pt join hinh_thuc_thanh_toan httt on pt.ma_hinh_thuc_thanh_toan = httt.ma_hinh_thuc_thanh_toan where pt.ma_phong_tro = ?";
    private final String ADD = "insert into phong_tro(ten_nguoi_thue,sdt,ngay_bat_dau,ma_hinh_thuc_thanh_toan,ghi_chu) values (?,?,?,?,?)";
    private final String DELETE = "call delete_phongtro_by_id(?)";
    private final String SEARCH = "select pt.ma_phong_tro,pt.ten_nguoi_thue,pt.sdt,pt.ngay_bat_dau,pt.ma_hinh_thuc_thanh_toan,httt.kieu_thue,pt.ghi_chu from phong_tro pt join hinh_thuc_thanh_toan httt on pt.ma_hinh_thuc_thanh_toan = httt.ma_hinh_thuc_thanh_toan where pt.ten_nguoi_thue like ? and pt.sdt like ?";
    private final String UPDATE = "update phong_tro set ten_nguoi_thue = ?,sdt= ?, ngay_bat_dau =?,ma_hinh_thuc_thanh_toan=?,ghi_chu=? where id = ?;";

    @Override
    public List<PhongTro> findAll() {
        List<PhongTro> phongTroList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int maPhongTro = resultSet.getInt("ma_phong_tro");
                String tenNguoiThue = resultSet.getString("ten_nguoi_thue");
                String soDienThoai = resultSet.getString("sdt");
                String ngayBatDau = resultSet.getString("ngay_bat_dau");
                int maHinhThucThanhToan = resultSet.getInt("ma_hinh_thuc_thanh_toan");
                String kieuThue = resultSet.getString("kieu_thue");
                HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(maHinhThucThanhToan, kieuThue);
                String ghiChu = resultSet.getString("ghi_chu");
                PhongTro phongTro = new PhongTro(maPhongTro, tenNguoiThue, soDienThoai, ngayBatDau, hinhThucThanhToan, ghiChu);
                phongTroList.add(phongTro);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return phongTroList;
    }


    @Override
    public PhongTro findById(int id) {
        PhongTro phongTro = null;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID))
        {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            phongTro = new PhongTro();
            if (resultSet.next()) {
                phongTro.setMaPhongTro(resultSet.getInt("ma_phong_tro"));
                phongTro.setTenNguoiThue(resultSet.getString("ten_nguoi_thue"));
                phongTro.setSoDienThoai(resultSet.getString("sdt"));
                phongTro.setNgayBatDau(resultSet.getString("ngay_bat_dau"));
                phongTro.setHinhThucThanhToan(new HinhThucThanhToan(resultSet.getString("kieu_thue")));
                phongTro.setGhiChu(resultSet.getString("ghi_chu"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return phongTro;

    }


    @Override
    public boolean add(PhongTro phongTro) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            preparedStatement.setString(1, phongTro.getTenNguoiThue());
            preparedStatement.setString(2, phongTro.getSoDienThoai());
            preparedStatement.setString(3, phongTro.getNgayBatDau());
            preparedStatement.setInt(4, phongTro.getHinhThucThanhToan().getId());
            preparedStatement.setString(5, phongTro.getGhiChu());
            return preparedStatement.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }


    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<PhongTro> search( String nameSearch, String sdtSearch) {
        List<PhongTro> searchList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+nameSearch+"%");
            preparedStatement.setString(2,"%"+sdtSearch+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                PhongTro phongTro = new PhongTro();
                phongTro.setMaPhongTro(resultSet.getInt("ma_phong_tro"));
                phongTro.setTenNguoiThue(resultSet.getString("ten_nguoi_thue"));
                phongTro.setSoDienThoai(resultSet.getString("sdt"));
                phongTro.setNgayBatDau(resultSet.getString("ngay_bat_dau"));
                phongTro.setHinhThucThanhToan(new HinhThucThanhToan( resultSet.getString("kieu_thue")));
                phongTro.setGhiChu(resultSet.getString("ghi_chu"));
                searchList.add(phongTro);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return searchList;
    }

    @Override
    public boolean update(PhongTro phongTro) throws SQLException{
        Connection connection = BaseRepository.getConnectDB();
        boolean rowUpdated;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);) {
            preparedStatement.setString(1, phongTro.getTenNguoiThue());
            preparedStatement.setString(2, phongTro.getSoDienThoai());
            preparedStatement.setString(3, phongTro.getNgayBatDau());
            preparedStatement.setInt(4, phongTro.getHinhThucThanhToan().getId());
            preparedStatement.setString(5, phongTro.getGhiChu());
            rowUpdated= preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
