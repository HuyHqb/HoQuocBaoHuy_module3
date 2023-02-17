package service.employee;

import model.employee.Employee;
import service.employee.impl.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    @Override
    public boolean addEmployee(Employee employee) {
        return false;
    }

    @Override
    public List<Employee> listEmployee() {
        return null;
    }

    @Override
    public Employee getEmployeeById(int id) {
        return null;
    }

    @Override
    public boolean deleteEmployee(int id) {
        return false;
    }
}
