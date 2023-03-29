package service.employee;

import model.employee.Position;
import repository.employee.PositionRepo;
import repository.employee.impl.IPositionRepo;
import service.employee.impl.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    IPositionRepo positionRepo = new PositionRepo();
    @Override
    public List<Position> findAll() {
        return positionRepo.findAll();
    }
}
