package repository.employee;

import model.customer.CustomerType;
import model.employee.WorkPart;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WorkPartRepo implements IWorkPartRepo{
    @Override
    public List<WorkPart> findAll() {
        List<WorkPart> listWorkPart = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from workpart_master");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("workpart_id");
                String type = resultSet.getString("workpart");
                WorkPart workPart = new WorkPart(id,type);
                listWorkPart.add(workPart);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listWorkPart;
    }
}
