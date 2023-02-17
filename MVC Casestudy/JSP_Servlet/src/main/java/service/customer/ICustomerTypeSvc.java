package service.customer;

import model.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeSvc {
    List<CustomerType> findAll();
}
