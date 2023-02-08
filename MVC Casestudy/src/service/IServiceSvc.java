package service;

import bean.service.AttachService;
import bean.service.Service;

import java.util.List;

public interface IServiceSvc {

    int addService(
            String name,
            int area,
            double cost,
            int maxNumberOfPeople,
            int rentTypeId,
            int serviceTypeId,
            String standardRoom,
            String descriptionConvenience,
            double poolArea,
            int numberOfFloor
    );

    List<Service> readAllServices();

    List<AttachService> readAllAttachServices();

    Service getServiceById(int id);

    AttachService getAttachServiceById(int id);

    void updateService(int id,
                       String name,
                       int area,
                       double cost,
                       int maxNumberOfPeople,
                       int rentTypeId,
                       int serviceTypeId,
                       String standardRoom,
                       String descriptionConvenience,
                       double poolArea,
                       int numberOfFloor);

    void deleteService(int id);
}
