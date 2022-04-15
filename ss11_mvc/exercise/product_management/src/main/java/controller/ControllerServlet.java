package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "ControllerServlet", value = "/product")
public class ControllerServlet extends HttpServlet {
    private IProductService iProductService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            case "search":
                request.getRequestDispatcher("search.jsp").forward(request,response);
                break;
            default:
            listProduct(request,response);
            break;
        }
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        String name = request.getParameter("name").toLowerCase();
        List<Product> products = iProductService.display();
        List<Product> searchProducts = new ArrayList<>();

        for (int i=0; i<products.size();i++){
            if (products.get(i).getName().toLowerCase().contains(name)){
                searchProducts.add(products.get(i));
            }
        }

        request.setAttribute("product", searchProducts);
        request.getRequestDispatcher("search.jsp").forward(request,response);
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String sku = request.getParameter("sku");
        Product product = iProductService.findBySku(sku);
        if(product == null){
            request.getRequestDispatcher("error-404.jsp").forward(request,response);
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("view.jsp").forward(request,response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sku = request.getParameter("sku");
        Product product = iProductService.findBySku(sku);

        if(product == null){
            request.getRequestDispatcher("error-404.jsp").forward(request,response);
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("edit.jsp").forward(request,response);
        }

    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String sku = request.getParameter("sku");
        Product product = iProductService.findBySku(sku);

        if(product == null){
            request.getRequestDispatcher("error-404.jsp").forward(request,response);
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("delete.jsp").forward(request,response);
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Product> products = iProductService.display();
        request.setAttribute("products", products);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }

        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "edit":
                updateProduct(request,response);
            case "search":
                showSearchForm(request,response);
                break;
            default:
                break;
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String sku = request.getParameter("sku");
        String name = request.getParameter("name");
        String price = request.getParameter("price");

        Product product = iProductService.findBySku(sku);

        if(product == null){
            request.getRequestDispatcher("error-404.jsp").forward(request,response);
        } else {
            product.setSku(sku);
            product.setName(name);
            product.setPrice(price);
            iProductService.update(sku, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Product information was updated");
            request.getRequestDispatcher("edit.jsp").forward(request,response);
        }

    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String sku = request.getParameter("sku");
        Product product = iProductService.findBySku(sku);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher=request.getRequestDispatcher("error-404.jsp");
        } else {
            iProductService.remove(sku);
            response.sendRedirect("/product");
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String sku= request.getParameter("sku");
        String name= request.getParameter("name");
        String price= request.getParameter("price");

        Product product = new Product(sku,name,price);
        iProductService.save(product);
        request.setAttribute("message","Creation successful");
        request.getRequestDispatcher("create.jsp").forward(request,response);
    }
}
