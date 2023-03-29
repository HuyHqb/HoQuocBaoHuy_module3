package repository.phongTro;

import model.PhongTro;

import java.sql.SQLException;
import java.util.List;

public interface IPhongTroRepo {
    List<PhongTro> findAll();
    PhongTro findById(int id);
    boolean add(PhongTro employee);
    boolean delete(int id);
    List<PhongTro> search(String tenNguoiThue, String soDienThoai);
    boolean update(PhongTro phongTro) throws SQLException;
}
