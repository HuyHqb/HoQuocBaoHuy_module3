package repository.employee.impl;

import model.employee.Employee;

import java.util.List;

public interface IEmployeeRepo {
    boolean addEmployee(Employee employee);

    List<Employee> listEmployee();

    Employee getEmployeeById(int id);


    boolean deleteEmployee(int id);
}
