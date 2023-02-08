package model.service;

import model.bean.User;
import model.dao.IUserDAO;
import model.dao.UserDAO;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    IUserDAO dao = new UserDAO();

    @Override
    public void insertUser(User user) throws SQLException {
        dao.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return dao.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return dao.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return dao.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return dao.updateUser(user);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return dao.selectUserByCountry(country);
    }

    @Override
    public List<User> selectAllUsersInorder() {
        return dao.selectAllUsersInorder();
    }

    @Override
    public User getUserById(int id) {
        return dao.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        dao.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permission) {
        dao.addUserTransaction(user, permission);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        dao.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        dao.insertUpdateUseTransaction();
    }

    @Override
    public void deleteUserStore(int id) {
        dao.deleteUserStore(id);
    }

    @Override
    public void editUserStore(int id, String name, String email, String country) {
        dao.editUserStore(id, name, email, country);
    }

    @Override
    public List<User> selectAllUserStore() {
        return dao.selectAllUserStore();
    }
}
