package service.svc;

import model.svc.RentType;
import repository.svc.IRentTypeRepo;
import repository.svc.RentTypeRepo;

import java.util.List;

public class RentTypeSvc implements IRentTypeSvc{
    @Override
    public List<RentType> findAll() {
        IRentTypeRepo rentTypeRepo = new RentTypeRepo();
        return rentTypeRepo.findAll();
    }
}
