package service.phongTro;

import model.phongTro.PhongTro;

import java.util.List;

public interface IPhongTroService {
    List<PhongTro> findAll();
    PhongTro findById(int id);
    boolean add(PhongTro phongTro);
    void delete(int id);
    List<PhongTro> search(String maPhongTro,String tenNguoiThue, String soDienThoai);
}
