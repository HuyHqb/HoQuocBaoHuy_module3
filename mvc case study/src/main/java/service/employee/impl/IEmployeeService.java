package service.employee.impl;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    boolean addEmployee(Employee employee);

    List<Employee> listEmployee();

    Employee getEmployeeById(int id);


    boolean deleteEmployee(int id);
}
