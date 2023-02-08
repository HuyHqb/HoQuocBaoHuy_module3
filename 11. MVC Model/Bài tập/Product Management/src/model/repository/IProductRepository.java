package model.repository;

import model.bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> listProducts();

    void createProduct(String name, int price, String description, String manufacturer);

    void updateProduct(int idProduct, String name, int price, String description, String manufacturer);

    void deleteProduct(int idProduct);

    Product searchProductByID(int idProduct);

    List<Product> searchProductByName(String name);
}
