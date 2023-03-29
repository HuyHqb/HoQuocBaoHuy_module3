package service;

import bean.Employee;
import bean.Job;
import repository.EmployeeRepo;
import repository.impl.IEmployeeRepo;
import service.impl.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();
    @Override
    public List<Employee> findAll() {
        return employeeRepo.findAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepo.findById(id);
    }

    @Override
    public boolean add(Employee employee) {
        return employeeRepo.add(employee);
    }

    @Override
    public List<Employee> search(String jobName, float minSalary, float maxSalary) {
        return employeeRepo.search(jobName,minSalary,maxSalary);
    }
}
