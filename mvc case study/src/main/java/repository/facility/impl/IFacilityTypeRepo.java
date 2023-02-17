package repository.facility.impl;

import model.facility.FacilityType;

import java.util.List;

public interface IFacilityTypeRepo {
    List<FacilityType> findAll();
}
