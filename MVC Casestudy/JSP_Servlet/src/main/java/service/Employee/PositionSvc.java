package service.Employee;

import model.employee.Position;
import repository.employee.IPositionRepo;
import repository.employee.PositionRepo;

import java.util.List;

public class PositionSvc implements IPositionSvc{
    @Override
    public List<Position> findAll() {
        IPositionRepo positionRepo = new PositionRepo();
        return positionRepo.findAll();
    }
}
