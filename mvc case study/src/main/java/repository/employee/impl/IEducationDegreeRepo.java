package repository.employee.impl;

import model.employee.EducationDegree;

import java.util.List;

public interface IEducationDegreeRepo {
    public List<EducationDegree> findAll();
}
