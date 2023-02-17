package repository.customer;

import model.customer.Customer;
import model.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeRepo {
    List<CustomerType> findAll();
}
