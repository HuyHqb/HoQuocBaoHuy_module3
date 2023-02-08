package service;

import bean.customer.Customer;

import java.util.Date;
import java.util.List;

public interface ICustomerSvc {

    int addCustomer(
            int typeId,
            String name,
            Date birthday,
            boolean gender,
            String idCard,
            String phone,
            String email,
            String address
    );

    List<Customer> readAllCustomers();

    void updateCustomer(
            int idEditedCustomer,
            int typeId,
            String name,
            Date birthday,
            boolean gender,
            String idCard,
            String phone,
            String email,
            String address
    );

    void deleteCustomer(int id);

    Customer getCustomerById(int id);
}
