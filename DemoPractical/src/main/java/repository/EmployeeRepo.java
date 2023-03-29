package repository;

import bean.Employee;
import bean.Job;
import repository.impl.IEmployeeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {
    private final String SElECT_ALL_EMPLOYEE = "Select e.*,j.job_name, j.min_salary,j.max_salary from employee e join job j on  j.job_id = e.job_id";
    private final String INSERT_INTO_EMPLOYEE = "insert into employee(full_name, birthday, address,start_day,end_day, salary,job_id) values(?,?,?,?,?,?,?)";
    private final String SEARCH = "Select e.*,j.job_name, j.min_salary,j.max_salary from employee e join job j on  j.job_id = e.job_id WHERE job_name like ? and min_salary like ? and max_salary like ?";

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SElECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String fullName = resultSet.getString("full_name");
                String birthday = resultSet.getString("birthday");
                String address = resultSet.getString("address");
                String startDay = resultSet.getString("start_day");
                String endDay = resultSet.getString("end_day");
                float salary = resultSet.getFloat("salary");
                int jobId = resultSet.getInt("job_id");
                String jobName = resultSet.getString("job_name");
                float minSalary = resultSet.getFloat("min_salary");
                float maxSalary = resultSet.getFloat("max_salary");
                Job job= new Job(jobId,jobName,minSalary,maxSalary);
                Employee employee = new Employee(id,fullName,birthday,address,startDay,endDay,salary,job);
                employeeList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public Employee findById(int id) {
        return null;
    }

    @Override
    public boolean add(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_EMPLOYEE);
            preparedStatement.setString(1, employee.getFullName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getAddress());
            preparedStatement.setString(4, employee.getStartDay());
            preparedStatement.setString(5, employee.getEndDay());
            preparedStatement.setDouble(6, employee.getSalary());
            preparedStatement.setInt(7, employee.getJob().getJobId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Employee> search(String jobName, float minSalary, float maxSalary) {
        List<Employee> searchList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        Employee employee = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+jobName+"%");
            preparedStatement.setString(2,"%"+minSalary+"%");
            preparedStatement.setString(2,"%"+maxSalary+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                employee = new Employee();
                employee.setId(resultSet.getInt("id"));
                employee.setFullName(resultSet.getString("full_name"));
                employee.setBirthday(resultSet.getString("birthday"));
                employee.setAddress(resultSet.getString("address"));
                employee.setStartDay(resultSet.getString("start_day"));
                employee.setEndDay(resultSet.getString("end_day"));
                employee.setSalary(resultSet.getFloat("salary"));
                employee.setJob(new Job(resultSet.getInt("job_id"),resultSet.getString("job_name"),resultSet.getFloat("min_salary"),resultSet.getFloat("max_salary")));
                searchList.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return searchList;
    }
}
