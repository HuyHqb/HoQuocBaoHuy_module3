package controller;

import bean.contract.ContractDetail;
import service.IContractSvc;
import service.impl.ContractSvc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    IContractSvc contractSvc = new ContractSvc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ContractDetail> list = contractSvc.readAllContractDetail();

        request.setAttribute("listContractDetail", list);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ContractDetail> list = contractSvc.readAllContractDetail();

        request.setAttribute("listContractDetail", list);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
