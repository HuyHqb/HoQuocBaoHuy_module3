package service.svc;

import model.svc.RentType;
import model.svc.ServiceType;
import repository.svc.IServiceTypeRepo;
import repository.svc.ServiceTypeRepo;

import java.util.List;

public class ServiceTypeSvc implements IServiceTypeSvc{
    @Override
    public List<ServiceType> findAll() {
        IServiceTypeRepo serviceTypeRepo = new ServiceTypeRepo();
        return serviceTypeRepo.findAll();
    }
}
