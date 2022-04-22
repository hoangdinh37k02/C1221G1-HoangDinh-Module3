package controller;


import model.service.Service;
import service.impl.service.ServiceServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceController", value = "/service")

public class ServiceController extends HttpServlet {
    ServiceServiceImpl serviceService=new ServiceServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createService(request,response);
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
                request.getRequestDispatcher("view/service/create.jsp").forward(request,response);
                break;
            case "list":
                listCustomer(request,response);
                break;

        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String tenDichVu = request.getParameter("tenDichVu");
        int dienTich = Integer.parseInt(request.getParameter("dienTich"));
        double chiPhiThue = Double.parseDouble(request.getParameter("chiPhiThue"));
        int soNguoiToiDa = Integer.parseInt(request.getParameter("soNguoiToiDa"));
        int maKieuThue = Integer.parseInt(request.getParameter("maKieuThue"));
        int maLoaiDichVu = Integer.parseInt(request.getParameter("maLoaiDichVu"));
        String tieuChuanPhong = request.getParameter("tieuChuanPhong");
        String tienNghiKhac = request.getParameter("tienNghiKhac");
        String dienTichHoBoi = request.getParameter("dienTichHoBoi");
        int soTang = Integer.parseInt(request.getParameter("soTang"));
        Service service = new Service(tenDichVu,dienTich,chiPhiThue,soNguoiToiDa,maKieuThue,maLoaiDichVu,
                tieuChuanPhong,tienNghiKhac,dienTichHoBoi,soTang);
        serviceService.insertService(service);
        request.getRequestDispatcher("view/service/create.jsp").forward(request,response);
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> serviceList = serviceService.selectAllService();
        request.setAttribute("serviceList", serviceList);;
        request.getRequestDispatcher("view/service/list.jsp").forward(request,response);
    }
}
