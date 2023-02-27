package repository.employee;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.BaseRepository;
import repository.employee.impl.IEmployeeRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {
    private final String SElECT_ALL_EMPLOYEE = "Select e.*, p.position,l.level, w.workpart from employee_info e join position_master p on  p.position_id = e.position_id join level_master l on l.level_id = e.level_id join workpart_master w on w.workpart_id = e.workpart_id";
    private final String INSERT_INTO_EMPLOYEE = "insert into employee_info(name, birthday, cardid, salary, phonenumber, email, address, position_id, level_id, workpart_id) values(?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE_EMPLOYEE_BY_ID = "call delete_employee_by_id(?)";
    private final String SEARCH = "Select e.*, p.position_type,ed.education_degree_type, d.division_type from employee e join position p on  p.id = e.position_id join education_degree ed on ed.id = e.education_degree_id join division d on d.id = e.division_id where e.name like ? and p.position like ?  and w.workpart like ?";

    @Override
    public boolean addEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition().getId());
            preparedStatement.setInt(9, employee.getEducationDegree().getId());
            preparedStatement.setInt(10, employee.getDivision().getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Employee> listEmployee() {
        List<Employee> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SElECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                String idCard = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                String positionType = resultSet.getString("position");
                Position position = new Position(positionId,positionType);
                int educationDegreeId = resultSet.getInt("level_id");
                String educationDegreeType = resultSet.getString("education_degree_type");
                EducationDegree educationDegree =  new EducationDegree(educationDegreeId,educationDegreeType);
                int divisionId = resultSet.getInt("division_id");
                String divisionType = resultSet.getString("division_type");
                Division division = new Division(divisionId,divisionType);
                Employee employee = new Employee(id,name,birthday,idCard,salary,phoneNumber,email,address,position,educationDegree,division);
                list.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public Employee getEmployeeById(int id) {
        return null;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(DELETE_EMPLOYEE_BY_ID);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
