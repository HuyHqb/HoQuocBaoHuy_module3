package service.impl;

import bean.Category;
import bean.Product;
import repository.IRepository;
import repository.impl.Repository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IRepository repo = new Repository();

    @Override
    public int addProduct(String name, int price, int quantity, String color, String description, int category) {
        return repo.addProduct(name, price, quantity, color, description, category);
    }

    @Override
    public List<Product> readAllProducts() {
        return repo.readAllProducts();
    }

    @Override
    public void updateProduct(int id,String name, int price, int quantity, String color, String description, int category) {
        repo.updateProduct(id,name, price, quantity, color, description, category);
    }

    @Override
    public void deleteProduct(int id) {
        repo.deleteProduct(id);
    }

    public List<Category> readAllCategories(){
        return repo.readAllCategories();
    }

    @Override
    public Product getProductById(int id) {
        return repo.getProductById(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return repo.findByName(name);
    }

    @Override
    public List<Product> findByPrice(int price) {
        return repo.findByPrice(price);
    }
}
