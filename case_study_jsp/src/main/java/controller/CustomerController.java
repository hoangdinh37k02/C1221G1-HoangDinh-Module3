package controller;

import model.Customer;
import model.CustomerType;
import service.impl.CustomerServiceImpl;
import service.impl.CustomerTypeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ResortServletController", value = "/resort")
public class CustomerController extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();
    CustomerTypeServiceImpl customerTypeService = new CustomerTypeServiceImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request,response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
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
                    List<CustomerType> customerTypeList=customerTypeService.selectAllCustomerType();
                    request.setAttribute("customerTypeList", customerTypeList);
                    request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
                case "list":
                    listCustomer(request,response);
                    break;
//                case "delete":
//                    deleteCustomer(request,response);
//                    break;
            }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maKhachHang = Integer.parseInt(request.getParameter("maKhachHang"));
        try {
            customerService.deleteCustomer(maKhachHang);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypeList=customerTypeService.selectAllCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
//        List<Customer> customerList = customerService.selectAllCustomer();
//        request.setAttribute("customerList",customerList);
//        request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int maKhachHang = Integer.parseInt(request.getParameter("maKhachHang"));
        int maLoaiKhach = Integer.parseInt(request.getParameter("maLoaiKhach"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        int gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
        String soCMND = request.getParameter("soCMND");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Customer customer = new Customer(maKhachHang,maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCMND,soDienThoai,email,diaChi);
        try {
            customerService.updateCustomer(customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
        int maKhachHang = Integer.parseInt(request.getParameter("maKhachHang"));
        List<CustomerType> customerTypeList=customerTypeService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        Customer customer = customerService.selectCustomer(maKhachHang);
        request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
        request.setAttribute("customer", customer);

    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypeList=customerTypeService.selectAllCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        request.getRequestDispatcher("view/customer/list.jsp").forward(request,response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int maLoaiKhach = Integer.parseInt(request.getParameter("maLoaiKhach"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        int gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
        String soCMND=request.getParameter("soCMND");
        String soDienThoai=request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Customer customer = new Customer(maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCMND,soDienThoai,email,diaChi);
        customerService.insertCustomer(customer);
        request.getRequestDispatcher("view/customer/create.jsp").forward(request,response);
    }

}
