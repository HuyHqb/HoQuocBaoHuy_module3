package service;

import bean.employee.Employee;

import java.util.Date;
import java.util.List;

public interface IEmployeeSvc {

    int addEmployee(
            String name,
            Date birthday,
            String idCard,
            double salary,
            String phone,
            String email,
            String address,
            int positionID,
            int educationDegreeID,
            int divisionID,
            String username);

    List<Employee> readAllEmployees();

    void updateEmployee(
            int idEditedEmployee,
            String name,
            Date birthday,
            String idCard,
            double salary,
            String phone,
            String email,
            String address,
            int positionID,
            int educationDegreeID,
            int divisionID
    );

    void deleteEmployee(int id);

    Employee getEmployeeById(int id);

}
