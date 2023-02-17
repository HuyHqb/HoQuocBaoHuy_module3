package service.svc;

import model.svc.Service;
import repository.svc.IServiceRepo;
import repository.svc.ServiceRepo;

import java.util.List;

public class ServiceSvc implements IServiceSvc {
    IServiceRepo serviceRepo = new ServiceRepo();

    @Override
    public boolean addService(Service service) {
        return serviceRepo.addService(service);
    }

    @Override
    public List<Service> listService() {
        //lay ds service tu db
        return serviceRepo.listService();
    }

    @Override
    public Service getServiceById(int id) {
        return null;
    }

    @Override
    public boolean deleteService(int id) {
        return serviceRepo.deleteService(id);
    }
}
