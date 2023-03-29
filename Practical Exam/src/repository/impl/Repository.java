package repository.impl;

import bean.Category;
import bean.Product;
import repository.IRepository;
import utils.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static utils.DBContext.getConnection;

public class Repository implements IRepository {
    @Override
    public int addProduct(String name, int price, int quantity, String color, String description, int category) {
        String INSERT_PRODUCT = "INSERT INTO product (name, price, quantity, color, description, category) VALUES (?,?,?,?,?,?);";

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(INSERT_PRODUCT, Statement.RETURN_GENERATED_KEYS);

            //set param
            pstmt.setString(1, name);
            pstmt.setInt(2, price);
            pstmt.setInt(3, quantity);
            pstmt.setString(4, color);
            pstmt.setString(5, description);
            pstmt.setInt(6, category);

            pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                return rs.getInt(1);
            }

            conn.close();
            pstmt.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<Product> readAllProducts() {
        List<Product> list = new ArrayList<>();
        String SELECT_ALL_PRODUCTS = "SELECT * FROM product INNER JOIN category ON product.category = category.id;";

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_PRODUCTS);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        new Category(rs.getInt(7), rs.getString(9))
                ));
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void updateProduct(int id, String name, int price, int quantity, String color, String description, int categoryId) {
        String UPDATE_PRODUCT = "UPDATE product SET name = ?, price = ?, quantity = ?, color = ?, description = ?, category = ? WHERE id = ?;";

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(UPDATE_PRODUCT);

            pstmt.setInt(7, id);
            pstmt.setString(1, name);
            pstmt.setInt(2, price);
            pstmt.setInt(3, quantity);
            pstmt.setString(4, color);
            pstmt.setString(5, description);
            pstmt.setInt(6, categoryId);

            pstmt.executeUpdate();

            conn.close();
            pstmt.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        String DELETE_PRODUCT = "DELETE FROM product WHERE id = ?;";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(DELETE_PRODUCT);
            pstmt.setInt(1, id);

            pstmt.executeUpdate();

            conn.close();
            pstmt.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }

    public List<Category> readAllCategories() {
        List<Category> list = new ArrayList<>();
        String SELECT_ALL_CATEGORY = "SELECT * FROM category";

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_CATEGORY);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Category(
                        rs.getInt(1),
                        rs.getString(2)
                ));
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Product getProductById(int id) {
        String SELECT_PRODUCT_BY_ID = "SELECT * FROM product WHERE id = ?;";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_PRODUCT_BY_ID);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        getCategoryById(rs.getInt(7))
                );
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> list = new ArrayList<>();
        String SELECT_PRODUCT_BY_NAME = "SELECT * FROM product WHERE name LIKE ?;";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_PRODUCT_BY_NAME);
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        getCategoryById(rs.getInt(7))
                ));
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Product> findByPrice(int price) {
        List<Product> list = new ArrayList<>();
        String SELECT_PRODUCT_BY_PRICE = "SELECT * FROM product WHERE price = ?;";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_PRODUCT_BY_PRICE);
            pstmt.setInt(1, price);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        getCategoryById(rs.getInt(7))
                ));
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    public Category getCategoryById(int id) {
        String SELECT_CATEGORY_BY_ID = "SELECT * FROM category WHERE id = ?;";

        try {
            Connection conn = DBContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SELECT_CATEGORY_BY_ID);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Category(
                        rs.getInt(1),
                        rs.getString(2));
            }

            conn.close();
            pstmt.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }
}
