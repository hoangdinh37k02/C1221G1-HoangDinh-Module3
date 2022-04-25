package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controller.ProductController", value = "/product")
public class ProductController extends HttpServlet {
    IProductService iProductService = new ProductServiceImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "edit":

                break;
            case "delete":

                break;
            case "search":

                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                break;
            case "edit":

                break;
            case "search":

                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        List<Product> productList = iProductService.selectAllProduct();
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("view/list.jsp").forward(request,response);
    }
}
