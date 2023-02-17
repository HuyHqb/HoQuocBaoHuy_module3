package service.svc;

import model.svc.RentType;
import model.svc.ServiceType;

import java.util.List;

public interface IRentTypeSvc {
    List<RentType> findAll();
}
