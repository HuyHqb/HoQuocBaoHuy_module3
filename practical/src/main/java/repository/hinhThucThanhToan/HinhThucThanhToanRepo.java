package repository.hinhThucThanhToan;

import model.HinhThucThanhToan;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HinhThucThanhToanRepo implements IHinhThucThanhToanRepo {
    @Override
    public List<HinhThucThanhToan> findAll() {
        List<HinhThucThanhToan> hinhThucThanhToanList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from hinh_thuc_thanh_toan");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int maHinhThucThanhToan = resultSet.getInt("ma_hinh_thuc_thanh_toan");
                String kieuThue = resultSet.getString("kieu_thue");
                HinhThucThanhToan hinhThucThanhToan = new HinhThucThanhToan(maHinhThucThanhToan,kieuThue);
                hinhThucThanhToanList.add(hinhThucThanhToan);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return hinhThucThanhToanList;
    }
}
