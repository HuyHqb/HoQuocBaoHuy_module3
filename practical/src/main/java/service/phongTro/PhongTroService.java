package service.phongTro;

import model.PhongTro;
import repository.phongTro.IPhongTroRepo;
import repository.phongTro.PhongTroRepo;

import java.util.List;

public class PhongTroService implements IPhongTroService {
    IPhongTroRepo phongTroRepo = new PhongTroRepo();
    @Override
    public List<PhongTro> findAll() {
        return phongTroRepo.findAll();
    }

    @Override
    public PhongTro findById(int id) {
        return phongTroRepo.findById(id);
    }

    @Override
    public boolean add(PhongTro phongTro) {
        return phongTroRepo.add(phongTro);
    }


    @Override
    public void delete(int id) {
        phongTroRepo.delete(id);
    }

    @Override
    public List<PhongTro> search(String nameSearch, String sdtSearch) {
        return phongTroRepo.search(nameSearch,sdtSearch);
    }
}
