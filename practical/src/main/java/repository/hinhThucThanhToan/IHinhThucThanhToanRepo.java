package repository.hinhThucThanhToan;

import model.HinhThucThanhToan;


import java.util.List;

public interface IHinhThucThanhToanRepo {
    List<HinhThucThanhToan> findAll();
}
