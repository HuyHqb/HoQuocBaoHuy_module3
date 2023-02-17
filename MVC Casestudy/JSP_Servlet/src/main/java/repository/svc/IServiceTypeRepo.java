package repository.svc;

import model.svc.ServiceType;

import java.util.List;

public interface IServiceTypeRepo {
    List<ServiceType> findAll();
}
