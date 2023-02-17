package repository.customer;

import model.customer.Customer;
import repository.customer.impl.ICustomerRepo;

import java.util.List;

public class CustomerRepo implements ICustomerRepo {
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
