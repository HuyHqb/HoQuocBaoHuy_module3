package service.svc;

import model.svc.ServiceType;

import java.util.List;

public interface IServiceTypeSvc {
    List<ServiceType> findAll();
}
