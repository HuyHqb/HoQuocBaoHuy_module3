package service.customer;

import model.customer.Customer;
import model.employee.Employee;

import java.util.List;

public interface ICustomerSvc {
    boolean addCustomer(Customer customer);

    List<Customer> listCustomer();

    Customer getCustomerById(int id);


    boolean deleteCustomer(int id);
}
