package controller;

import model.bean.Product;
import model.service.IProductService;
import model.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    private final IProductService service = new ProductService();

    private final String JSP_LIST_PRODUCT = "product/listProduct.jsp";
    private final String JSP_CREATE_FORM = "product/createProduct.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }

        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            default:
                showProducts(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }

        switch (action){
            case "showProducts":
                showProducts(request,response);
                break;
            case "create":
                createProduct(request, response);
                break;
            case "delete":

                break;
            case "edit":
                editProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            default:

                break;
        }
    }

    private void showProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listProduct",service.listProducts());

        request.getRequestDispatcher(JSP_LIST_PRODUCT).forward(request,response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher(JSP_CREATE_FORM).forward(request,response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        int price = Integer.parseInt(request.getParameter("price"));

        service.createProduct(name,price,description,manufacturer);
        request.setAttribute("message","Product was added!");

        showProducts(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        service.deleteProduct(id);
        request.setAttribute("message","Deleted successfully");

        showProducts(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = service.searchProductByID(id);
        request.setAttribute("editProduct",product);

        request.getRequestDispatcher("product/editProduct.jsp").forward(request,response);
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        int price = Integer.parseInt(request.getParameter("price"));

        int id = Integer.parseInt(request.getParameter("id"));
        service.updateProduct(id,name,price,description,manufacturer);

        showEditForm(request, response);
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = service.searchProductByID(id);
        request.setAttribute("product",product);

        request.getRequestDispatcher("product/viewProduct.jsp").forward(request,response);
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("valueSearch");

        List<Product> result = service.searchProductByName(search);

        request.setAttribute("listProduct",result);
        request.setAttribute("search",search);

        request.getRequestDispatcher(JSP_LIST_PRODUCT).forward(request,response);
    }
}
