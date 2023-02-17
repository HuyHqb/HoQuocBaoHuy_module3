package repository.employee;

import model.customer.CustomerType;
import model.employee.Level;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LevelRepo implements ILevelRepo{
    @Override
    public List<Level> findAll() {
        List<Level> listLevel = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from level_master");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("level_id");
                String type = resultSet.getString("level");
                Level level = new Level(id,type);
                listLevel.add(level);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listLevel;
    }
}
