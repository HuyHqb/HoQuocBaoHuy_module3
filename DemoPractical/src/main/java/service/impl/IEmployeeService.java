package service.impl;

import bean.Employee;
import bean.Job;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    Employee findById(int id);
    boolean add(Employee employee);
    List<Employee> search(String jobName, float minSalary, float maxSalary);
}
