package repository.impl;

import bean.contract.Contract;
import bean.contract.ContractDetail;
import repository.IContractRepo;
import service.impl.CustomerSvc;
import service.impl.EmployeeSvc;
import service.impl.ServiceSvc;
import util.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class ContractRepo implements IContractRepo {
    @Override
    public void addContract(Date startDate, Date endDate, double deposit, double totalMoney, int employeeId, int customerId, int serviceId) {
        try {
            String INSERT_CONTRACT = "INSERT INTO contract (contract_start_date, contract_end_date, contract_deposit, contract_total_money, employee_id, customer_id, service_id) VALUES (?,?,?,?,?,?,?);";
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(INSERT_CONTRACT);
            pstmt.setDate(1, new java.sql.Date(startDate.getTime()));
            pstmt.setDate(2, new java.sql.Date(endDate.getTime()));
            pstmt.setDouble(3, deposit);
            pstmt.setDouble(4, totalMoney);
            pstmt.setInt(5, employeeId);
            pstmt.setInt(6, customerId);
            pstmt.setInt(7, serviceId);

            pstmt.executeUpdate();

            conn.close();
            pstmt.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void addContractDetail(int contractId, int attachServiceId, int quantity) {
        String INSERT_CONTRACT_DETAIL = "INSERT INTO contract_detail (contract_id, attach_service_id, quantity) VALUES (?,?,?);";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(INSERT_CONTRACT_DETAIL);
            pstmt.setInt(1, contractId);
            pstmt.setInt(2, attachServiceId);
            pstmt.setInt(3, quantity);
            pstmt.executeUpdate();

            conn.close();
            pstmt.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Contract> readAllContracts() {
        String SELECT_ALL_CONTRACTS = "SELECT * FROM contract;";
        List<Contract> list = new ArrayList<>();

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_CONTRACTS);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Contract(
                        rs.getInt(1),
                        new Date(rs.getDate(2).getTime()),
                        new Date(rs.getDate(3).getTime()),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        new EmployeeSvc().getEmployeeById(rs.getInt(6)),
                        new CustomerSvc().getCustomerById(rs.getInt(7)),
                        new ServiceSvc().getServiceById(rs.getInt(8))
                ));
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public List<ContractDetail> readAllContractDetail() {
        String SELECT_ALL_CONTRACT_DETAIL = "SELECT * FROM contract_detail;";
        List<ContractDetail> list = new ArrayList<>();

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_CONTRACT_DETAIL);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new ContractDetail(
                        rs.getInt(1),
                        getContractById(rs.getInt(2)),
                        new ServiceRepo().getAttachServiceById(rs.getInt(3)),
                        rs.getInt(4)
                ));
            }

            Collections.sort(list);
            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    public Contract getContractById(int id) {
        String SELECT_CONTRACT_BY_ID = "SELECT * FROM contract WHERE contract_id = ?;";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_CONTRACT_BY_ID);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Contract(
                        rs.getInt(1),
                        new Date(rs.getDate(2).getTime()),
                        new Date(rs.getDate(3).getTime()),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        new EmployeeSvc().getEmployeeById(rs.getInt(6)),
                        new CustomerSvc().getCustomerById(rs.getInt(7)),
                        new ServiceSvc().getServiceById(rs.getInt(8))
                );
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }
}
