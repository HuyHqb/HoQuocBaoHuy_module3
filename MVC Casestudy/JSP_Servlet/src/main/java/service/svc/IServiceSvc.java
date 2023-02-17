package service.svc;

import model.svc.Service;

import java.util.List;

public interface IServiceSvc {

    boolean addService(Service service);

    List<Service> listService();

    Service getServiceById(int id);


    boolean deleteService(int id);
}
