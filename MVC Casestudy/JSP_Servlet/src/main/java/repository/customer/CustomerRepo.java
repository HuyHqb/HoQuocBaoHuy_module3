package repository.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customer.ICustomerRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    private final String SElECT_ALL = "select c_info.*, c_master.type from customer_info c_info join customertype_master c_master on c_info.customertype_id = c_master.customertype_id";
    private final String DELETE_CUSTOMER_BY_ID = "call delete_customer_by_id(?)";
    private final String INSERT_INTO = "insert into customer_info(customertype_id, name,  birthday, sex, cardid, phonenumber, email, address) values(?,?,?,?,?,?,?,?)";

    @Override
    public boolean addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setInt(1, customer.getCustomerType().getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setInt(4, customer.getSex());
            preparedStatement.setString(5, customer.getCardId());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> listCustomer() {
        List<Customer> listCustomer = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SElECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                int customerTypeId = resultSet.getInt("customertype_id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                int sex = resultSet.getInt("sex");
                String cardId = resultSet.getString("cardid");
                String phoneNumber = resultSet.getString("phonenumber");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String type = resultSet.getString("type");
                CustomerType customerType = new CustomerType(customerTypeId, type);
                Customer customer = new Customer(id, customerType, name, birthday, sex, cardId, phoneNumber, email, address);
                listCustomer.add(customer);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listCustomer;
    }

    @Override
    public Customer getCustomerById(int id) {
        return null;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER_BY_ID);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
