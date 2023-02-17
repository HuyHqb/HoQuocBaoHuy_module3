package repository.facility.impl;

import model.facility.RentType;

import java.util.List;

public interface IRentTypeRepo {
    List<RentType> findAll();
}
