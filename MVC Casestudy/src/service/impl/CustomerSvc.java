package service.impl;

import bean.customer.Customer;
import repository.ICustomerRepo;
import repository.impl.CustomerRepo;
import service.ICustomerSvc;

import java.util.Date;
import java.util.List;

public class CustomerSvc implements ICustomerSvc {
    ICustomerRepo repo = new CustomerRepo();

    @Override
    public Customer getCustomerById(int id) {
        return repo.getCustomerById(id);
    }

    @Override
    public int addCustomer(int typeId, String name, Date birthday, boolean gender, String idCard, String phone, String email, String address) {
        return repo.addCustomer(typeId,
                name,
                birthday,
                gender,
                idCard,
                phone,
                email,
                address);
    }

    @Override
    public List<Customer> readAllCustomers() {
        return repo.readAllCustomers();
    }

    @Override
    public void updateCustomer(int idEditedCustomer, int typeId, String name, Date birthday, boolean gender, String idCard, String phone, String email, String address) {
        repo.updateCustomer(
                idEditedCustomer,
                typeId,
                name,
                birthday,
                gender,
                idCard,
                phone,
                email,
                address);
    }

    @Override
    public void deleteCustomer(int id) {
        repo.deleteCustomer(id);
    }
}
