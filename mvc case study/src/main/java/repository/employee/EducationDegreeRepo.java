package repository.employee;

import model.customer.CustomerType;
import model.employee.EducationDegree;
import repository.BaseRepository;
import repository.employee.impl.IEducationDegreeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepo implements IEducationDegreeRepo {
    @Override
    public List<EducationDegree> findAll() {
        List<EducationDegree> listEducationDegree = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from education_degree");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String type = resultSet.getString("type");
                EducationDegree educationDegree = new EducationDegree(id,type);
                listEducationDegree.add(educationDegree);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listEducationDegree;
    }
}
