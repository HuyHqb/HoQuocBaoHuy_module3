package repository.customer;

import model.customer.CustomerType;
import repository.customer.impl.ICustomerTypeRepo;

import java.util.List;

public class CustomerTypeRepo implements ICustomerTypeRepo {
    @Override
    public List<CustomerType> findAll() {
        return null;
    }
}
