package model.repository;

import model.bean.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductRepository implements IProductRepository {

    public static List<Product> listProduct = new ArrayList<>();

    static {
        listProduct.add(new Product(1, "Iphone 6", 20000, "No", "Apple"));
        listProduct.add(new Product(2, "Macbook", 200000, "No", "Apple"));
        listProduct.add(new Product(3, "Samsung", 10000, "No", "abc"));
        listProduct.add(new Product(4, "Laptop", 20000, "No", "Dell"));
        listProduct.add(new Product(5, "Asus", 20000, "No", "Asus"));
    }

    @Override
    public List<Product> listProducts() {
        return listProduct;
    }

    @Override
    public void createProduct(String name, int price, String description, String manufacturer) {
        listProduct.add(new Product(creteID(), name, price, description, manufacturer));
    }

    @Override
    public void updateProduct(int idProduct, String name, int price, String description, String manufacturer) {
        Product product = searchProductByID(idProduct);
        if (product != null) {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setManufacturer(manufacturer);
        }
    }

    @Override
    public void deleteProduct(int idProduct) {
        listProduct.remove(searchProductByID(idProduct));
    }

    @Override
    public Product searchProductByID(int idProduct) {
        return listProduct.stream()
                .filter(product -> product.getId() == idProduct)
                .findAny()
                .orElse(null);
    }

    @Override
    public List<Product> searchProductByName(String name){
        return listProduct.stream()
                .filter(product -> product.getName().contains(name.toLowerCase()) ||
                        product.getName().contains(name.toUpperCase()))
                .collect(Collectors.toList());

    }

    public int creteID() {
        if (listProduct.isEmpty()) {
            return 1;
        } else
            return listProduct.get(listProduct.size() - 1).getId() + 1;
    }

    public static void main(String[] args) {
        new ProductRepository().createProduct("abc", 123, "des", "manufacturer");

        List<Product> list = new ProductRepository().searchProductByName("a");
        for (Product product : list) {
            System.out.println(product.getId() + " " + product.getName());
        }
    }
}
