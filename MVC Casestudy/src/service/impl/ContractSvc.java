package service.impl;

import bean.contract.Contract;
import bean.contract.ContractDetail;
import repository.IContractRepo;
import repository.impl.ContractRepo;
import service.IContractSvc;

import java.util.Date;
import java.util.List;

public class ContractSvc implements IContractSvc {
    IContractRepo repo = new ContractRepo();

    @Override
    public void addContract(Date startDate, Date endDate, double deposit, double totalMoney, int employeeId, int customerId, int serviceId) {
        repo.addContract(
                startDate,
                endDate,
                deposit,
                totalMoney,
                employeeId,
                customerId,
                serviceId
        );
    }

    @Override
    public void addContractDetail(int contractId, int attachServiceId, int quantity) {
        repo.addContractDetail(contractId, attachServiceId, quantity);
    }

    @Override
    public List<Contract> readAllContracts() {
        return repo.readAllContracts();
    }

    @Override
    public List<ContractDetail> readAllContractDetail() {
        return repo.readAllContractDetail();
    }
}
