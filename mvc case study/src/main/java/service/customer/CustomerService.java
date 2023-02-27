package service.customer;

import model.customer.Customer;
import repository.customer.CustomerRepo;
import repository.customer.CustomerTypeRepo;
import repository.customer.impl.ICustomerRepo;
import repository.customer.impl.ICustomerTypeRepo;
import service.customer.impl.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepo customerRepo = new CustomerRepo();
    ICustomerTypeRepo customerTypeRepo = new CustomerTypeRepo();
    @Override
    public boolean addCustomer(Customer customer) {
        return customerRepo.addCustomer(customer);
    }

    @Override
    public List<Customer> listCustomer() {
        return customerRepo.listCustomer();
    }

    @Override
    public Customer getCustomerById(int id) {
        return null;
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepo.deleteCustomer(id);
    }
}
