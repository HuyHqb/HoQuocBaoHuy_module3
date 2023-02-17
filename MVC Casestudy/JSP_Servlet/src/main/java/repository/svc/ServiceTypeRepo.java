package repository.svc;

import model.svc.ServiceType;
import repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepo implements IServiceTypeRepo{
    @Override
    public List<ServiceType> findAll() {
        List<ServiceType> listServiceType = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from servicetype_master");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("servicetype_id");
                String type = resultSet.getString("type");
                ServiceType serviceType = new ServiceType(id,type);
                listServiceType.add(serviceType);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listServiceType;
    }
}
