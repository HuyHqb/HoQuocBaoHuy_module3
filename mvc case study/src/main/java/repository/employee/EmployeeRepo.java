package repository.employee;

import model.employee.Employee;
import repository.employee.impl.IEmployeeRepo;

import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {
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
