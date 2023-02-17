package service.Employee;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeSvc {
    boolean addEmployee(Employee employee);

    List<Employee> listEmployee();

    Employee getEmployeeById(int id);


    boolean deleteEmployee(int id);
}
