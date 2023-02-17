package repository.customer;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepo {
    boolean addCustomer(Customer customer);

    List<Customer> listCustomer();

    Customer getCustomerById(int id);


    boolean deleteCustomer(int id);
}
