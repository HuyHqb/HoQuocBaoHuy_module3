package repository.svc;

import model.svc.RentType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepo implements IRentTypeRepo {
    @Override
    public List<RentType> findAll() {
        List<RentType> listRentType = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from renttype_master");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("renttype_id");
                String type = resultSet.getString("type");
                RentType rentType = new RentType(id,type);
                listRentType.add(rentType);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listRentType;
    }
}
