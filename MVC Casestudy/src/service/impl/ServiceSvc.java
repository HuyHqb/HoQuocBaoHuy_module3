package service.impl;

import bean.service.AttachService;
import bean.service.Service;
import repository.IServiceRepo;
import repository.impl.ServiceRepo;
import service.IServiceSvc;

import java.util.List;

public class ServiceSvc implements IServiceSvc {
    IServiceRepo repo = new ServiceRepo();

    @Override
    public int addService(String name, int area, double cost, int maxNumberOfPeople, int rentTypeId, int serviceTypeId, String standardRoom, String descriptionConvenience, double poolArea, int numberOfFloor) {
        return repo.addService(name,
                area,
                cost,
                maxNumberOfPeople,
                rentTypeId,
                serviceTypeId,
                standardRoom,
                descriptionConvenience,
                poolArea,
                numberOfFloor);
    }

    @Override
    public List<Service> readAllServices() {
        return repo.readAllServices();
    }

    @Override
    public List<AttachService> readAllAttachServices() {
        return repo.readAllAttachServices();
    }

    @Override
    public Service getServiceById(int id) {
        return repo.getServiceById(id);
    }

    @Override
    public AttachService getAttachServiceById(int id) {
        return repo.getAttachServiceById(id);
    }

    @Override
    public void updateService(int id, String name, int area, double cost, int maxNumberOfPeople, int rentTypeId, int serviceTypeId, String standardRoom, String descriptionConvenience, double poolArea, int numberOfFloor) {
        repo.updateService(id, name, area, cost, maxNumberOfPeople, rentTypeId, serviceTypeId, standardRoom, descriptionConvenience, poolArea, numberOfFloor);
    }

    @Override
    public void deleteService(int id) {
        repo.deleteService(id);
    }
}
