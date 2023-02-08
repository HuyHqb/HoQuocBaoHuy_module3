package repository.impl;

import bean.employee.*;
import repository.IEmployeeRepo;
import util.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static util.DBContext.getConnection;

public class EmployeeRepo implements IEmployeeRepo {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public int addEmployee(
            String name,
            Date birthday,
            String idCard,
            double salary,
            String phone,
            String email,
            String address,
            int positionID,
            int educationDegreeID,
            int divisionID,
            String username) {

        String INSERT_EMPLOYEE = "INSERT INTO employee (" +
                "employee_name, " +
                "employee_birthday, " +
                "employee_id_card, " +
                "employee_salary, " +
                "employee_phone, " +
                "employee_email, " +
                "employee_address, " +
                "position_id, " +
                "education_degree_id, " +
                "division_id, " +
                "username) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?);";
        String INSERT_USER = "INSERT INTO user (username, password) VALUES (?,12345);";
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(INSERT_EMPLOYEE, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, name);
            pstmt.setDate(2, new java.sql.Date(birthday.getTime()));
            pstmt.setString(3, idCard);
            pstmt.setDouble(4, salary);
            pstmt.setString(5, phone);
            pstmt.setString(6, email);
            pstmt.setString(7, address);
            pstmt.setInt(8, positionID);
            pstmt.setInt(9, educationDegreeID);
            pstmt.setInt(10, divisionID);
            pstmt.setString(11, username);

            PreparedStatement pstmt2 = conn.prepareStatement(INSERT_USER);
            pstmt2.setString(1, username);

            pstmt2.executeUpdate();
            pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                return rs.getInt(1);
            }

            pstmt2.close();
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
    public List<Employee> readAllEmployees() {
        List<Employee> list = new ArrayList<>();
        String SELECT_ALL_EMPLOYEE = "SELECT * FROM employee;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_EMPLOYEE);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("employee_name"),
                        new Date(rs.getDate("employee_birthday").getTime()),
                        rs.getString("employee_id_card"),
                        rs.getDouble("employee_salary"),
                        rs.getString("employee_phone"),
                        rs.getString("employee_email"),
                        rs.getString("employee_address"),
                        getPositionById(rs.getInt("position_id")),
                        getEducationDegreeById(rs.getInt("education_degree_id")),
                        getDivisionById(rs.getInt("division_id")),
                        getUserByUName(rs.getString("username"))
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
    public void updateEmployee(int idEditedEmployee,
                               String name,
                               Date birthday,
                               String idCard,
                               double salary,
                               String phone,
                               String email,
                               String address,
                               int positionID,
                               int educationDegreeID,
                               int divisionID) {
        String UPDATE_EMPLOYEE = "UPDATE employee " +
                "SET employee_name = ?," +
                "employee_birthday = ?," +
                "employee_id_card = ?," +
                "employee_salary = ?," +
                "employee_phone = ?," +
                "employee_email = ?," +
                "employee_address = ?," +
                "position_id = ?," +
                "education_degree_id = ?," +
                "division_id = ? " +
                "WHERE employee_id = ?;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(UPDATE_EMPLOYEE);

            pstmt.setInt(11, idEditedEmployee);
            pstmt.setString(1, name);
            pstmt.setDate(2, new java.sql.Date(birthday.getTime()));
            pstmt.setString(3, idCard);
            pstmt.setDouble(4, salary);
            pstmt.setString(5, phone);
            pstmt.setString(6, email);
            pstmt.setString(7, address);
            pstmt.setInt(8, positionID);
            pstmt.setInt(9, educationDegreeID);
            pstmt.setInt(10, divisionID);

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
    public void deleteEmployee(int id) {
        String DELETE_EMPLOYEE = "DELETE FROM employee WHERE employee_id = ?;";
        String UPDATE_CONTRACT = "UPDATE contract SET employee_id = NULL WHERE employee_id = ?;";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(DELETE_EMPLOYEE);
            pstmt.setInt(1, id);

            PreparedStatement pstmt2 = conn.prepareStatement(UPDATE_CONTRACT);
            pstmt2.setInt(1, id);

            pstmt2.executeUpdate();
            pstmt.executeUpdate();

            pstmt2.close();
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
    public Employee getEmployeeById(int id) {
        String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employee WHERE employee_id = ?;";

        try {
            conn = DBContext.getConnection();
            pstmt = conn.prepareStatement(SELECT_EMPLOYEE_BY_ID);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Employee(
                        rs.getInt("employee_id"),
                        rs.getString("employee_name"),
                        new Date(rs.getDate("employee_birthday").getTime()),
                        rs.getString("employee_id_card"),
                        rs.getDouble("employee_salary"),
                        rs.getString("employee_phone"),
                        rs.getString("employee_email"),
                        rs.getString("employee_address"),
                        getPositionById(rs.getInt("position_id")),
                        getEducationDegreeById(rs.getInt("education_degree_id")),
                        getDivisionById(rs.getInt("division_id")),
                        getUserByUName(rs.getString("username"))
                );
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null;
    }

    public Division getDivisionById(int id) {
        String SELECT_DIVISION = "SELECT * FROM division WHERE division_id = ?;";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DIVISION);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new Division(
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

    public EducationDegree getEducationDegreeById(int id) {
        String SELECT_EDUCATION_DEGREE = "SELECT * FROM education_degree WHERE education_degree_id = ?;";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EDUCATION_DEGREE);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new EducationDegree(
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

    public Position getPositionById(int id) {
        String SELECT_POSITION = "SELECT * FROM position WHERE position_id = ?;";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSITION);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new Position(
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

    public User getUserByUName(String username) {
        String SELECT_USER = "SELECT * FROM user WHERE username = ?;";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new User(
                        resultSet.getString(1),
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

    public boolean checkLogin(String username, String password) {
        String GET_PASSWORD = "SELECT password FROM user WHERE username = ?;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(GET_PASSWORD);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return password.equals(rs.getString(1));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    public String getNameByUName(String username) {
        String SELECT_NAME = "SELECT employee_name FROM employee WHERE username = ?;";

        try {
            Connection connection = DBContext.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NAME);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getString(1);
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
