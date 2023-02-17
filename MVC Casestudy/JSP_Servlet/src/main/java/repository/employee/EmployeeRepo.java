package repository.employee;

import model.employee.Employee;
import model.employee.Level;
import model.employee.Position;
import model.employee.WorkPart;
import repository.BaseRepository;
import repository.employee.IEmployeeRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {
    private final String SElECT_ALL_EMPLOYEE = "Select e.*, p.position,l.level, w.workpart from employee_info e join position_master p on  p.position_id = e.position_id join level_master l on l.level_id = e.level_id join workpart_master w on w.workpart_id = e.workpart_id";
    private final String INSERT_INTO_EMPLOYEE = "insert into employee_info(name, birthday, cardid, salary, phonenumber, email, address, position_id, level_id, workpart_id) values(?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE_EMPLOYEE_BY_ID = "call delete_employee_by_id(?)";
    private final String SEARCH = "Select e.*, p.position,l.level, w.workpart from employee_info e join position_master p on  p.position_id = e.position_id join level_master l on l.level_id = e.level_id join workpart_master w on w.workpart_id = e.workpart_id where e.name like ? and p.position like ?  and w.workpart like ?";

    @Override
    public boolean addEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getCardId());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition().getId());
            preparedStatement.setInt(9, employee.getLevel().getId());
            preparedStatement.setInt(10, employee.getWorkPart().getId());
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
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                String cardId = resultSet.getString("cardid");
                double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phonenumber");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                String positionType = resultSet.getString("position");
                Position position = new Position(positionId,positionType);
                int levelId = resultSet.getInt("level_id");
                String levelType = resultSet.getString("level");
                Level level =  new Level(levelId,levelType);
                int workPartId = resultSet.getInt("workpart_id");
                String workPartType = resultSet.getString("workpart");
                WorkPart workPart = new WorkPart(workPartId,workPartType);
                Employee employee = new Employee(id,name,birthday,cardId,salary,phoneNumber,email,address,position,level,workPart);
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
