package repository.customer.impl;

import model.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeRepo {
    List<CustomerType> findAll();
}
