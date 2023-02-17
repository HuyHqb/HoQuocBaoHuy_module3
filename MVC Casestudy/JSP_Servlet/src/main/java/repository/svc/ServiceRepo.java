package repository.svc;

import model.svc.RentType;
import model.svc.Service;
import model.svc.ServiceType;
import repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepo implements IServiceRepo {
    private final String SElECT_ALL_SERVICE = "select s.*, rt.type rent_type, st.type as service_type from service s join renttype_master rt on rt.renttype_id =  s.renttype_id join servicetype_master st on s.servicetype_id = st.servicetype_id";
    private final String INSERT_INTO_SERVICE = "insert into service(name,area,rentprice,maxperson,renttype_Id,service_typeId,standard,other_service_description,pool_area,floor,free_service) values(?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE_SERVICE_BY_ID = "call delete_service_by_id(?)";

    @Override
    public boolean addService(Service service) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_SERVICE);
            preparedStatement.setString(1, service.getName());
            preparedStatement.setInt(2, service.getArea());
            preparedStatement.setInt(3, service.getMaxPerson());
            preparedStatement.setInt(4, service.getRentType().getId());
            preparedStatement.setInt(5, service.getServiceType().getId());
            preparedStatement.setString(6, service.getStandard());
            preparedStatement.setString(7, service.getOtherServiceDescription());
            preparedStatement.setDouble(8, service.getPoolArea());
            preparedStatement.setInt(9, service.getFloor());
            preparedStatement.setString(10, service.getFreeService());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return false;
    }

    @Override
    public List<Service> listService() {
        //lay ds service tu db
        List<Service> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SElECT_ALL_SERVICE);
            ResultSet resultset = preparedStatement.executeQuery();
            while (resultset.next()) {
                int id = resultset.getInt("service_id");
                String name = resultset.getString("name");
                int area = resultset.getInt("area");
                double rentPrice = resultset.getDouble("rentprice");
                int maxPerson = resultset.getInt("maxperson");
                int rentTypeId = resultset.getInt("renttype_id");
                String rentTypeName = resultset.getString("rent_type");
                RentType rentType = new RentType(rentTypeId,rentTypeName);
                int serviceTypeId = resultset.getInt("servicetype_id");
                String serviceTypeName = resultset.getString("service_type");
                ServiceType serviceType = new ServiceType(serviceTypeId,serviceTypeName);
                String standard = resultset.getString("standard");
                String otherServiceDescription = resultset.getString("other_service_description");
                double poolArea = resultset.getDouble("pool_area");
                int floor = resultset.getInt("floor");
                String freeService = resultset.getString("free_service");
                Service service = new Service(id, name, area, rentPrice, maxPerson, rentType,serviceType, standard, otherServiceDescription, poolArea, floor, freeService);
                list.add(service);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public Service getServiceById(int id) {
        return null;
    }

    @Override
    public boolean deleteService(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_SERVICE_BY_ID);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
