package service.customer;

import model.customer.CustomerType;
import repository.customer.CustomerTypeRepo;
import repository.customer.ICustomerTypeRepo;

import java.util.List;

public class CustomerTypeSvc implements ICustomerTypeSvc {
    @Override
    public List<CustomerType> findAll() {
        ICustomerTypeRepo customerTypeRepo = new CustomerTypeRepo();
        return customerTypeRepo.findAll();
    }
}
