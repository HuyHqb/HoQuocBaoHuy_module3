package repository.customer;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customer.impl.ICustomerTypeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepo implements ICustomerTypeRepo {
    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> listCustomerType = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from customer_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String type = resultSet.getString("type");
                CustomerType customerType = new CustomerType(id,type);
                listCustomerType.add(customerType);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listCustomerType;
    }
}
