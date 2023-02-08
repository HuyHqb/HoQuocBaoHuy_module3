package model.service;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{

    private final ProductRepository repository = new ProductRepository();

    @Override
    public List<Product> listProducts() {
        return repository.listProducts();
    }

    @Override
    public void createProduct(String name, int price, String description, String manufacturer) {
        repository.createProduct(name,price,description,manufacturer);
    }

    @Override
    public void updateProduct(int idProduct, String name, int price, String description, String manufacturer) {
        repository.updateProduct(idProduct,name,price,description,manufacturer);
    }

    @Override
    public void deleteProduct(int idProduct) {
        repository.deleteProduct(idProduct);
    }

    @Override
    public Product searchProductByID(int idProduct) {
        return repository.searchProductByID(idProduct);
    }

    @Override
    public List<Product> searchProductByName(String name){
        return repository.searchProductByName(name);
    }

    public static void main(String[] args) {
        new ProductRepository().createProduct("abc", 123, "des", "manufacturer");

        List<Product> list = new ProductService().searchProductByName("a");
        for (Product product : list) {
            System.out.println(product.getId() + " " + product.getName());
        }
    }
}
