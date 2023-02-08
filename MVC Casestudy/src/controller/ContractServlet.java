package controller;

import bean.contract.Contract;
import bean.customer.Customer;
import bean.employee.Employee;
import bean.service.AttachService;
import bean.service.Service;
import service.IContractSvc;
import service.IServiceSvc;
import service.impl.ContractSvc;
import service.impl.CustomerSvc;
import service.impl.EmployeeSvc;
import service.impl.ServiceSvc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            showCreateContractForm(request, response);
        } else if (action.equals("contractDetail")) {
            showCreateContractDetailForm(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("addContract")) {
            addContract(request, response);
        } else if (action.equals("addContractDetail")) {
            addContractDetail(request, response);
        }
    }

    private void showCreateContractForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IServiceSvc service = new ServiceSvc();
        List<Service> list = service.readAllServices();

        request.setAttribute("listServices", list);
        request.getRequestDispatcher("contract/add-contract.jsp").forward(request, response);
    }

    private void addContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startDate"));
            Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endDate"));
            double deposit = Double.parseDouble(request.getParameter("deposit"));
            double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
            int employeeId = Integer.parseInt(request.getParameter("employeeId"));
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int serviceId = Integer.parseInt(request.getParameter("serviceId"));

            Employee employee = new EmployeeSvc().getEmployeeById(employeeId);
            Customer customer = new CustomerSvc().getCustomerById(customerId);

            boolean valid = true;
            if (employee == null) {
                request.setAttribute("errorNullEmployee", "Employee ID is not exist");
                valid = false;
            }
            if (customer == null) {
                request.setAttribute("errorNullCustomer", "Employee ID is not exist");
                valid = false;
            }

            if (valid) {
                new ContractSvc().addContract(startDate, endDate, deposit, totalMoney, employeeId, customerId, serviceId);
                request.setAttribute("message", "Add Successfully!");
            } else {
                Contract contract = new Contract(startDate, endDate, deposit, totalMoney, new Employee(employeeId), new Customer(customerId), new Service(serviceId));
                request.setAttribute("contract", contract);
            }

            IServiceSvc service = new ServiceSvc();
            List<Service> list = service.readAllServices();

            request.setAttribute("listServices", list);
            request.getRequestDispatcher("contract/add-contract.jsp").forward(request, response);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void showCreateContractDetailForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IServiceSvc service = new ServiceSvc();
        IContractSvc contractSvc = new ContractSvc();
        List<AttachService> listAttachServices = service.readAllAttachServices();
        List<Contract> listContracts = contractSvc.readAllContracts();

        request.setAttribute("listAttachServices", listAttachServices);
        request.setAttribute("listContracts", listContracts);
        request.getRequestDispatcher("contract/add-contractdetail.jsp").forward(request, response);
    }

    private void addContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contractId = Integer.parseInt(request.getParameter("idContract"));
        int attachServiceId = Integer.parseInt(request.getParameter("idAttachService"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        new ContractSvc().addContractDetail(contractId, attachServiceId, quantity);

        showCreateContractDetailForm(request, response);
    }
}
