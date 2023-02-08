package repository.impl;

import bean.service.AttachService;
import bean.service.RentType;
import bean.service.Service;
import bean.service.ServiceType;
import repository.IServiceRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static util.DBContext.getConnection;

public class ServiceRepo implements IServiceRepo {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    @Override
    public int addService(String name, int area, double cost, int maxNumberOfPeople, int rentTypeId, int serviceTypeId, String standardRoom, String descriptionConvenience, double poolArea, int numberOfFloor) {
        String INSERT_SERVICE = "INSERT INTO service (" +
                "service_name, " +
                "service_area, " +
                "service_cost, " +
                "service_max_people, " +
                "rent_type_id, " +
                "service_type_id, " +
                "standard_room, " +
                "description_other_convenience, " +
                "pool_area, " +
                "number_of_floors) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?);";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(INSERT_SERVICE, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, name);
            pstmt.setInt(2, area);
            pstmt.setDouble(3, cost);
            pstmt.setInt(4, maxNumberOfPeople);
            pstmt.setInt(5, rentTypeId);
            pstmt.setInt(6, serviceTypeId);
            pstmt.setString(7, standardRoom);
            pstmt.setString(8, descriptionConvenience);
            pstmt.setDouble(9, poolArea);
            pstmt.setInt(10, numberOfFloor);

            pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return 0;
    }

    @Override
    public List<Service> readAllServices() {
        List<Service> list = new ArrayList<>();

        String SELECT_ALL_SERVICES = "SELECT * FROM service;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_SERVICES);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Service(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        getRentTypeById(rs.getInt(6)),
                        getServiceTypeById(rs.getInt(7)),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getDouble(10),
                        rs.getInt(11)
                ));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return list;
    }

    @Override
    public List<AttachService> readAllAttachServices() {
        List<AttachService> list = new ArrayList<>();
        String SELECT_ALL_ATTACH_SERVICES = "SELECT * FROM attach_service;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(SELECT_ALL_ATTACH_SERVICES);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new AttachService(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5)
                ));
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return list;
    }

    public RentType getRentTypeById(int id) {
        String SELECT_RENT_TYPE_BY_ID = "SELECT * FROM rent_type WHERE rent_type_id = ?";

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RENT_TYPE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new RentType(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getDouble(3)
                );
            }

            connection.close();
            preparedStatement.close();
            resultSet.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public ServiceType getServiceTypeById(int id) {
        String SELECT_SERVICE_TYPE_BY_ID = "SELECT * FROM service_type WHERE service_type_id = ?";

        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SERVICE_TYPE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new ServiceType(
                        resultSet.getInt(1),
                        resultSet.getString(2)
                );
            }

            connection.close();
            preparedStatement.close();
            resultSet.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public AttachService getAttachServiceById(int id) {
        String SELECT_ATTACH_SERVICE_BY_ID = "SELECT * FROM attach_service WHERE attach_service_id = ?;";

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_ATTACH_SERVICE_BY_ID);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new AttachService(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5)
                );
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    @Override
    public Service getServiceById(int id) {
        String SELECT_SERVICE_BY_ID = "SELECT * FROM service WHERE service_id = ?;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(SELECT_SERVICE_BY_ID);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Service(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        getRentTypeById(rs.getInt(6)),
                        getServiceTypeById(rs.getInt(7)),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getDouble(10),
                        rs.getInt(11)
                );
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return null;
    }

    @Override
    public void updateService(int id, String name, int area, double cost, int maxNumberOfPeople, int rentTypeId, int serviceTypeId, String standardRoom, String descriptionConvenience, double poolArea, int numberOfFloor) {
        String UPDATE_SERVICE = "UPDATE service SET service_name = ?," +
                "service_area = ?," +
                "service_cost = ?," +
                "service_max_people = ?," +
                "rent_type_id = ?," +
                "service_type_id = ?," +
                "standard_room = ?," +
                "description_other_convenience = ?," +
                "pool_area = ?," +
                "number_of_floors = ?" +
                " WHERE service_id = ?;";
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(UPDATE_SERVICE);

            pstmt.setInt(11, id);
            pstmt.setString(1, name);
            pstmt.setInt(2, area);
            pstmt.setDouble(3, cost);
            pstmt.setInt(4, maxNumberOfPeople);
            pstmt.setInt(5, rentTypeId);
            pstmt.setInt(6, serviceTypeId);
            pstmt.setString(7, standardRoom);
            pstmt.setString(8, descriptionConvenience);
            pstmt.setDouble(9, poolArea);
            pstmt.setInt(10, numberOfFloor);

            pstmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public void deleteService(int id) {
        String DELETE_SERVICE = "DELETE FROM service WHERE service_id = ?;";
        String UPDATE_CONTRACT = "UPDATE contract SET service_id = ?  WHERE service_id = ?;";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(DELETE_SERVICE);
            PreparedStatement pstmt2 = conn.prepareStatement(UPDATE_CONTRACT);

            pstmt.setInt(1, id);
            pstmt2.setInt(2, id);
            pstmt2.setNull(1, Types.INTEGER);

            pstmt2.executeUpdate();
            pstmt.executeUpdate();

            pstmt2.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
