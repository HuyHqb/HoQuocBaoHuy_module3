package service.customer;

import model.customer.Customer;
import repository.customer.CustomerRepo;
import repository.customer.CustomerTypeRepo;
import repository.customer.ICustomerRepo;
import repository.customer.ICustomerTypeRepo;

import java.util.List;

public class CustomerSvc implements ICustomerSvc {
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
