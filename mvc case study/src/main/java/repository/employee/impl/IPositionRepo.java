package repository.employee.impl;

import model.employee.Position;

import java.util.List;

public interface IPositionRepo {
    public List<Position> findAll();
}
