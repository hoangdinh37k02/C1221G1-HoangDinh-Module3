package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

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
            default:
            listProduct(request,response);
            break;
        }
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

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String sku = request.getParameter("sku");
        Product product = iProductService.findBySku(sku);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
            default:
                break;
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        String sku = request.getParameter("sku");
        String name = request.getParameter("name");
        String price = request.getParameter("price");

        Product product = iProductService.findBySku(sku);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setSku(sku);
            product.setName(name);
            product.setPrice(price);
            iProductService.update(sku, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Product information was updated");
            dispatcher = request.getRequestDispatcher("edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response){
        String sku = request.getParameter("sku");
        Product product = iProductService.findBySku(sku);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher=request.getRequestDispatcher("error-404.jsp");
        } else {
            iProductService.remove(sku);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
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
