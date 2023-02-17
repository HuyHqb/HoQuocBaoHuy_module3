package service.Employee;

import model.employee.Employee;
import repository.employee.IEmployeeRepo;
import repository.employee.EmployeeRepo;

import java.util.List;

public class EmployeeSvc implements IEmployeeSvc {
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
