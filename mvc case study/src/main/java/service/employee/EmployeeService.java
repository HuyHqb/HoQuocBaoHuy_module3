package service.employee;

import model.employee.Employee;
import repository.employee.EmployeeRepo;
import repository.employee.impl.IEmployeeRepo;
import service.employee.impl.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();
    @Override
    public boolean addEmployee(Employee employee) {
        return employeeRepo.addEmployee(employee);
    }

    @Override
    public List<Employee> listEmployee() {
        return employeeRepo.listEmployee();
    }

    @Override
    public Employee getEmployeeById(int id) {
        return null;
    }

    @Override
    public boolean deleteEmployee(int id) {
        return employeeRepo.deleteEmployee(id);
    }
}
