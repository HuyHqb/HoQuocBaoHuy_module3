package service;

import bean.Category;
import bean.Product;

import java.util.List;

public interface IProductService {
    int addProduct(String name, int price, int quantity, String color, String description, int category);

    List<Product> readAllProducts();

    void updateProduct(int id,String name, int price, int quantity, String color, String description, int category);

    void deleteProduct(int id);

    List<Category> readAllCategories();

    Product getProductById(int id);

    List<Product> findByName(String name);

    List<Product> findByPrice(int price);

}
