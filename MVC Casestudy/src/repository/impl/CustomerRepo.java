package repository.impl;

import bean.customer.Customer;
import bean.customer.CustomerType;
import repository.ICustomerRepo;
import util.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static util.DBContext.getConnection;

public class CustomerRepo implements ICustomerRepo {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public int addCustomer(int typeId, String name, Date birthday, boolean gender, String idCard, String phone, String email, String address) {
        String INSERT_CUSTOMER = "INSERT INTO customer (" +
                "customer_type_id, " +
                "customer_name, " +
                "customer_birthday, " +
                "customer_gender, " +
                "customer_id_card, " +
                "customer_phone, " +
                "customer_email, " +
                "customer_address) " +
                "VALUES (?,?,?,?,?,?,?,?);";
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(INSERT_CUSTOMER, Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, typeId);
            pstmt.setString(2, name);
            pstmt.setDate(3, new java.sql.Date(birthday.getTime()));
            pstmt.setBoolean(4, gender);
            pstmt.setString(5, idCard);
            pstmt.setString(6, phone);
            pstmt.setString(7, email);
            pstmt.setString(8, address);

            pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error when inserting!!");
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return 0;
    }

    @Override
    public List<Customer> readAllCustomers() {
        List<Customer> list = new ArrayList<>();
        String SELECT_ALL_CUSTOMER = "SELECT * FROM customer;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_CUSTOMER);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Customer(
                        rs.getInt(1),
                        getCustomerTypeById(rs.getInt(2)),
                        rs.getString(3),
                        new Date(rs.getDate(4).getTime()),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                ));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }

    @Override
    public void updateCustomer(int idEditedCustomer, int typeId, String name, Date birthday, boolean gender, String idCard, String phone, String email, String address) {
        String UPDATE_CUSTOMER = "UPDATE customer " +
                "SET customer_type_id = ?," +
                "customer_name = ?," +
                "customer_birthday = ?," +
                "customer_gender = ?," +
                "customer_id_card = ?," +
                "customer_phone = ?," +
                "customer_email = ?," +
                "customer_address = ?" +
                "WHERE customer_id = ?;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(UPDATE_CUSTOMER);

            pstmt.setInt(1, typeId);
            pstmt.setString(2, name);
            pstmt.setDate(3, new java.sql.Date(birthday.getTime()));
            pstmt.setBoolean(4, gender);
            pstmt.setString(5, idCard);
            pstmt.setString(6, phone);
            pstmt.setString(7, email);
            pstmt.setString(8, address);
            pstmt.setInt(9, idEditedCustomer);

            pstmt.executeUpdate();

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteCustomer(int id) {
        String DELETE_CUSTOMER = "DELETE FROM customer WHERE customer_id = ?";
        String DELETE_CONTRACT = "DELETE FROM contract WHERE customer_id = ? ;";
        String DELETE_CONTRACT_DETAIL = "DELETE FROM contract_detail " +
                "WHERE contract_id = (SELECT contract_id FROM  contract WHERE customer_id = ?)";
        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(DELETE_CUSTOMER);
            pstmt.setInt(1, id);

            PreparedStatement pstmt2 = conn.prepareStatement(DELETE_CONTRACT);
            PreparedStatement pstmt3 = conn.prepareStatement(DELETE_CONTRACT_DETAIL);
            pstmt2.setInt(1, id);
            pstmt3.setInt(1, id);

            pstmt3.executeUpdate();
            pstmt2.executeUpdate();
            pstmt.executeUpdate();

            pstmt2.close();
            pstmt3.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Customer getCustomerById(int id) {
        String SELECT_CUSTOMER_BY_ID = "SELECT * FROM customer WHERE customer_id = ?";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new Customer(
                        resultSet.getInt(1),
                        getCustomerTypeById(resultSet.getInt(2)),
                        resultSet.getString(3),
                        new Date(resultSet.getDate(4).getTime()),
                        resultSet.getBoolean(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getString(9)
                );
            }

            connection.close();
            preparedStatement.close();
            resultSet.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    public CustomerType getCustomerTypeById(int id) {
        String SELECT_CUSTOMER_TYPE = "SELECT * FROM customer_type WHERE customer_type_id = ?";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new CustomerType(
                        resultSet.getInt(1),
                        resultSet.getString(2)
                );
            }

            connection.close();
            preparedStatement.close();
            resultSet.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }
}
