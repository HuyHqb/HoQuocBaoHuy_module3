package repository.hinhThucThanhToan;

import model.hinhThucThanhToan.HinhThucThanhToan;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HinhThucThanhToanRepo implements IHinhThucThanhToanRepo{
    @Override
    public List<HinhThucThanhToan> findAll() {
        List<HinhThucThanhToan> list = new ArrayList<>();
        HinhThucThanhToan hinhThucThanhToan = null;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from hinh_thuc_thanh_toan");) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                hinhThucThanhToan = new HinhThucThanhToan();
                hinhThucThanhToan.setId(resultSet.getInt("id"));
                hinhThucThanhToan.setKieuThue(resultSet.getString("kieu_thue"));
                list.add(hinhThucThanhToan);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
