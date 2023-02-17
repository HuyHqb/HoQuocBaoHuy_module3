package repository.facility;

import model.facility.Facility;
import repository.facility.impl.IFacilityRepo;

import java.util.List;

public class FacilityRepo implements IFacilityRepo {
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
