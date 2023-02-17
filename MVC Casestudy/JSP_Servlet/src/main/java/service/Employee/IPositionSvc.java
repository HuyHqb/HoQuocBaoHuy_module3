package service.Employee;

import model.employee.Position;

import java.util.List;

public interface IPositionSvc {
    List<Position> findAll();
}
