package service.impl;

import bean.employee.Employee;
import repository.impl.EmployeeRepo;
import service.IEmployeeSvc;

import java.util.Date;
import java.util.List;

public class EmployeeSvc implements IEmployeeSvc {
    EmployeeRepo repository = new EmployeeRepo();

    @Override
    public int addEmployee(
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
            String username) {
        return repository.addEmployee(
                name,
                birthday,
                idCard,
                salary,
                phone,
                email,
                address,
                positionID,
                educationDegreeID,
                divisionID,
                username);
    }

    @Override
    public List<Employee> readAllEmployees() {
        return repository.readAllEmployees();
    }

    @Override
    public void updateEmployee(int idEditedEmployee,
                               String name,
                               Date birthday,
                               String idCard,
                               double salary,
                               String phone,
                               String email,
                               String address,
                               int positionID,
                               int educationDegreeID,
                               int divisionID) {
        repository.updateEmployee(idEditedEmployee,
                name,
                birthday,
                idCard,
                salary,
                phone,
                email,
                address,
                positionID,
                educationDegreeID,
                divisionID);
    }

    @Override
    public void deleteEmployee(int id) {
        repository.deleteEmployee(id);
    }

    @Override
    public Employee getEmployeeById(int id) {
        return repository.getEmployeeById(id);
    }

    public boolean checkLogin(String username, String password) {
        return repository.checkLogin(username, password);
    }

    public String getNameByUName(String username) {
        return repository.getNameByUName(username);
    }
}
