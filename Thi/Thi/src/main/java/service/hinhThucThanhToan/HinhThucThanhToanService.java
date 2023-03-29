package service.hinhThucThanhToan;

import model.hinhThucThanhToan.HinhThucThanhToan;
import repository.hinhThucThanhToan.HinhThucThanhToanRepo;
import repository.hinhThucThanhToan.IHinhThucThanhToanRepo;

import java.util.List;

public class HinhThucThanhToanService implements IHinhThucThanhToanService {
    IHinhThucThanhToanRepo hinhThucThanhToanRepo = new HinhThucThanhToanRepo();
    @Override
    public List<HinhThucThanhToan> findAll() {
        return hinhThucThanhToanRepo.findAll();
    }
}
