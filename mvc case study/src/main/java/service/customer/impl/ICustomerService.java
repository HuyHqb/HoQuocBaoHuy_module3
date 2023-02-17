package service.customer.impl;

import model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    boolean addCustomer(Customer customer);

    List<Customer> listCustomer();

    Customer getCustomerById(int id);


    boolean deleteCustomer(int id);
}
