package repository;

import bean.service.AttachService;
import bean.service.Service;

import java.util.List;

public interface IServiceRepo {

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

    AttachService getAttachServiceById(int id);

    Service getServiceById(int id);

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
