package service.customer;

import model.customer.CustomerType;
import repository.customer.CustomerTypeRepo;
import repository.customer.impl.ICustomerTypeRepo;
import service.customer.impl.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomerTypeRepo customerTypeRepo = new CustomerTypeRepo();
    @Override
    public List<CustomerType> findAll() {
        return customerTypeRepo.findAll();
    }
}
