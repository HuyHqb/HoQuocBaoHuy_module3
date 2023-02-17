package service.facility.impl;

import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    boolean addFacility(Facility facility);

    List<Facility> listFacility();

    Facility getFacilityById(int id);

    boolean deleteFacility(int id);
}
