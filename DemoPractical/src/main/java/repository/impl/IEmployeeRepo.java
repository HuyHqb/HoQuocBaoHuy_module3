package repository.impl;

import bean.Employee;
import bean.Job;

import java.util.List;

public interface IEmployeeRepo {
    List<Employee> findAll();
    Employee findById(int id);
    boolean add(Employee employee);
    List<Employee> search(String jobName, float minSalary, float maxSalary);

}
