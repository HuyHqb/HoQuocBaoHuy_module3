package controller;

import bean.Category;
import bean.Product;
import service.IProductService;
import service.impl.ProductService;
import utils.Validator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    IProductService service = new ProductService();
    Validator validate = new Validator();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            default:
                showListProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "showEditForm":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void showListProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = service.readAllProducts();

        request.setAttribute("listProducts", list);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> listCategories = service.readAllCategories();

        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("add.jsp").forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isValid = true;

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        int colorId = Integer.parseInt(request.getParameter("color"));
        String color;
        switch (colorId) {
            case 1:
                color = "Red";
                break;
            case 2:
                color = "Green";
                break;
            case 3:
                color = "Black";
                break;
            case 4:
                color = "White";
                break;
            default:
                color = "Yellow";
                break;
        }
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        if (name.isEmpty()) {
            isValid = false;
            request.setAttribute("errorName", "Please enter name");
        }

        if (!validate.isValidPrice(price)) {
            isValid = false;
            request.setAttribute("errorPrice", "Price must be positive integer and bigger than 10.000.000đ");
        }

        if (!validate.isPositiveInteger(quantity)) {
            isValid = false;
            request.setAttribute("errorQuantity", "Quantity must be positive integer");
        }

        if (isValid) {
            int id = service.addProduct(
                    name,
                    Integer.parseInt(price),
                    Integer.parseInt(quantity),
                    color,
                    description,
                    categoryId
            );

            request.setAttribute("newProductId", id);
            request.setAttribute("message", "Add Product Successfully");
            showListProducts(request, response);
        } else {
            request.setAttribute("name", name);
            request.setAttribute("price", price);
            request.setAttribute("quantity", quantity);
            request.setAttribute("colorId", colorId);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("description", description);
            List<Category> listCategories = service.readAllCategories();

            request.setAttribute("listCategories", listCategories);

            request.getRequestDispatcher("add.jsp").forward(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = service.getProductById(id);
        List<Category> listCategories = service.readAllCategories();

        request.setAttribute("listCategories", listCategories);
        request.setAttribute("id", id);
        request.setAttribute("name", product.getName());
        request.setAttribute("price", product.getPrice());
        request.setAttribute("quantity", product.getQuantity());
        request.setAttribute("colorId", product.getColorId());
        request.setAttribute("categoryId", product.getCategory().getId());
        request.setAttribute("description", product.getDescription());

        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isValid = true;

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        int colorId = Integer.parseInt(request.getParameter("color"));
        String color;
        switch (colorId) {
            case 1:
                color = "Red";
                break;
            case 2:
                color = "Green";
                break;
            case 3:
                color = "Black";
                break;
            case 4:
                color = "White";
                break;
            default:
                color = "Yellow";
                break;
        }
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        if (name.isEmpty()) {
            isValid = false;
            request.setAttribute("errorName", "Please enter name");
        }

        if (!validate.isValidPrice(price)) {
            isValid = false;
            request.setAttribute("errorPrice", "Price must be positive integer and bigger than 10.000.000đ");
        }

        if (!validate.isPositiveInteger(quantity)) {
            isValid = false;
            request.setAttribute("errorQuantity", "Quantity must be positive integer");
        }

        if (isValid) {
            service.updateProduct(
                    id,
                    name,
                    Integer.parseInt(price),
                    Integer.parseInt(quantity),
                    color,
                    description,
                    categoryId
            );

            request.setAttribute("id", id);
            request.setAttribute("message", "Edit Successfully");
            showEditForm(request, response);
        } else {
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("price", price);
            request.setAttribute("quantity", quantity);
            request.setAttribute("colorId", colorId);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("description", description);

            List<Category> listCategories = service.readAllCategories();

            request.setAttribute("listCategories", listCategories);
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        service.deleteProduct(id);
        request.setAttribute("message", "Delete Successfully!");

        showListProducts(request, response);
    }
}

