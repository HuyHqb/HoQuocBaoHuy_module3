package repository.employee;

import model.employee.Level;

import java.util.List;

public interface ILevelRepo {
    public List<Level> findAll();
}
