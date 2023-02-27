package repository.customer;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customer.impl.ICustomerRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    private final String SElECT_ALL = "select c.*, c_type.type from customer c join customer_type c_type on c.customer_type_id = c_type.id order by(c.id);";
    private final String DELETE_CUSTOMER_BY_ID = "call delete_customer_by_id(?)";
    private final String INSERT_INTO = "insert into customer(name,  birthday, gender, id_card, phone_number, email, address,customer_type_id) values(?,?,?,?,?,?,?,?)";
    @Override
    public boolean addCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);

            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getBirthday());
            preparedStatement.setInt(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setInt(8, customer.getCustomerType().getId());
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
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                int gender = resultSet.getInt("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String customerTypeType = resultSet.getString("type");
                CustomerType customerType = new CustomerType(customerTypeId, customerTypeType);
                Customer customer = new Customer(id , name, birthday, gender, idCard, phoneNumber, email, address,customerType);
                listCustomer.add(customer);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listCustomer;    }

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
        return false;    }
}
