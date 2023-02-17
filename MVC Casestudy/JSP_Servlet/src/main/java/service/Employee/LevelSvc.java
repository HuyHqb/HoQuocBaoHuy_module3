package service.Employee;

import model.employee.Level;
import repository.employee.ILevelRepo;
import repository.employee.LevelRepo;

import java.util.List;

public class LevelSvc implements ILevelSvc{

    @Override
    public List<Level> findAll() {
        ILevelRepo levelRepo = new LevelRepo();
        return levelRepo.findAll();
    }
}
