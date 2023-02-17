package service.Employee;

import model.employee.WorkPart;
import repository.employee.IWorkPartRepo;
import repository.employee.WorkPartRepo;

import java.util.List;

public class WorkPartSvc implements IWorkPartSvc{
    IWorkPartRepo workPartRepo = new WorkPartRepo();
    @Override
    public List<WorkPart> findAll() {
        return workPartRepo.findAll();
    }
}
