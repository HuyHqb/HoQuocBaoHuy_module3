package repository.hinhThucThanhToan;

import model.hinhThucThanhToan.HinhThucThanhToan;

import java.util.List;

public interface IHinhThucThanhToanRepo {
    List<HinhThucThanhToan> findAll();
}
