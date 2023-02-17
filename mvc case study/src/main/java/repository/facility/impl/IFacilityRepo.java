package repository.facility.impl;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepo {
    boolean addFacility(Facility facility);

    List<Facility> listFacility();

    Facility getFacilityById(int id);

    boolean deleteFacility(int id);
}
