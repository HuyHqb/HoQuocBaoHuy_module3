package service.employee;

import model.employee.Division;
import repository.employee.DivisionRepo;
import repository.employee.impl.IDivisionRepo;
import service.employee.impl.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    IDivisionRepo divisionRepo = new DivisionRepo();
    @Override
    public List<Division> findAll() {
        return divisionRepo.findAll();
    }
}
