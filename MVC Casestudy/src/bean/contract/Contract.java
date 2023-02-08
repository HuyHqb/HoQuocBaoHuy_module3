package bean.contract;

import bean.customer.Customer;
import bean.employee.Employee;
import bean.service.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Contract {
    private int id;
    private Date startDate;
    private Date endDate;
    private double deposit;
    private double totalMoney;
    private Employee employee;
    private Customer customer;
    private Service service;

    public Contract(int id, Date startDate, Date endDate, double deposit, double totalMoney, Employee employee, Customer customer, Service service) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
    }

    public Contract(Date startDate, Date endDate, double deposit, double totalMoney, Employee employee, Customer customer, Service service) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartDate() {
        return new SimpleDateFormat("dd/MM/yyyy").format(startDate);
    }

    public String getStartDateForInput() {
        return new SimpleDateFormat("yyyy-MM-dd").format(startDate);
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return new SimpleDateFormat("dd/MM/yyyy").format(endDate);
    }

    public String getEndDateForInput() {
        return new SimpleDateFormat("yyyy-MM-dd").format(endDate);
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public double getDeposit() {
        return deposit;
    }

    public void setDeposit(double deposit) {
        this.deposit = deposit;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }
}
