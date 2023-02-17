package repository.svc;

import model.svc.RentType;

import java.util.List;

public interface IRentTypeRepo {
    List<RentType> findAll();
}
