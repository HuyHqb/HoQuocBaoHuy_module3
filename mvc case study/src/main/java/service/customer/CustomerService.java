package service.customer;

import model.customer.Customer;
import service.customer.impl.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    @Override
    public boolean addCustomer(Customer customer) {
        return false;
    }

    @Override
    public List<Customer> listCustomer() {
        return null;
    }

    @Override
    public Customer getCustomerById(int id) {
        return null;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return false;
    }
}
