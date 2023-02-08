package service;

import bean.contract.Contract;
import bean.contract.ContractDetail;

import java.util.Date;
import java.util.List;

public interface IContractSvc {

    void addContract(Date startDate,
                     Date endDate,
                     double deposit,
                     double totalMoney,
                     int employeeId,
                     int customerId,
                     int serviceId);

    void addContractDetail(int contractId, int attachServiceId, int quantity);

    List<Contract> readAllContracts();

    List<ContractDetail> readAllContractDetail();
}
