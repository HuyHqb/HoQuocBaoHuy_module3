package repository.employee;

import model.customer.CustomerType;
import model.employee.Position;
import repository.BaseRepository;
import repository.employee.impl.IPositionRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepo implements IPositionRepo {
    @Override
    public List<Position> findAll() {
        List<Position> listPosition = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from position");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String type = resultSet.getString("type");
                Position position = new Position(id,type);
                listPosition.add(position);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listPosition;
    }
}
