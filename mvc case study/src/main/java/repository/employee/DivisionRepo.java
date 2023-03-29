package repository.employee;

import model.customer.CustomerType;
import model.employee.Division;
import repository.BaseRepository;
import repository.employee.impl.IDivisionRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepo implements IDivisionRepo {
    @Override
    public List<Division> findAll() {
        List<Division> listDivision = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from division");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String type = resultSet.getString("type");
                Division division = new Division(id,type);
                listDivision.add(division);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listDivision;
    }
}
