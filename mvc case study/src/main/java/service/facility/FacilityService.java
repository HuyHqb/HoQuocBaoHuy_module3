package service.facility;

import model.facility.Facility;
import service.facility.impl.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    @Override
    public boolean addFacility(Facility facility) {
        return false;
    }

    @Override
    public List<Facility> listFacility() {
        return null;
    }

    @Override
    public Facility getFacilityById(int id) {
        return null;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }
}
