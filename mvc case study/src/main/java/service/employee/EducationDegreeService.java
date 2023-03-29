package service.employee;

import model.employee.EducationDegree;
import repository.employee.EducationDegreeRepo;
import repository.employee.impl.IEducationDegreeRepo;
import service.employee.impl.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    IEducationDegreeRepo educationDegreeRepo = new EducationDegreeRepo();
    @Override
    public List<EducationDegree> findAll() {
        return educationDegreeRepo.findAll();
    }
}
