package repository.employee;

import model.employee.WorkPart;

import java.util.List;

public interface IWorkPartRepo {
    public List<WorkPart> findAll();
}
