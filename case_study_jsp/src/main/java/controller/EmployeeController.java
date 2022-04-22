package controller;

import model.customer.Customer;
import model.employee.Department;
import model.employee.Employee;
import model.employee.Level;
import model.employee.Position;
import service.IEmployeeService;
import service.impl.employee.EmployeeDepartmentServiceImpl;
import service.impl.employee.EmployeeLevelServiceImpl;
import service.impl.employee.EmployeePositionServiceImpl;
import service.impl.employee.EmployeeServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeController", value = "/employee")
public class EmployeeController extends HttpServlet {
    private IEmployeeService iEmployeeService = new EmployeeServiceImpl();
    private EmployeeDepartmentServiceImpl employeeDepartmentService = new EmployeeDepartmentServiceImpl();
    private EmployeeLevelServiceImpl employeeLevelService = new EmployeeLevelServiceImpl();
    private EmployeePositionServiceImpl employeePositionService = new EmployeePositionServiceImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertEmployee(request,response);
                break;
            case "edit":
                updateEmployee(request,response);
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
            case "search":
                searchByName(request,response);
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
                List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
                List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
                List<Position> positionList = employeePositionService.selectAllEmployeePosition();
                request.setAttribute("departmentList",departmentList);
                request.setAttribute("levelList",levelList);
                request.setAttribute("positionList",positionList);
                request.getRequestDispatcher("view/employee/create.jsp").forward(request,response);
                break;
            case  "list":
                listEmployee(request,response);
                break;
            case  "edit":
                showEditForm(request,response);
                break;
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").toLowerCase();
        List<Employee> employeeList= iEmployeeService.searchByName(name);
        request.setAttribute("employeeList", employeeList);
        List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
        List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
        List<Position> positionList = employeePositionService.selectAllEmployeePosition();
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("levelList",levelList);
        request.setAttribute("positionList",positionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);


    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maNhanVien = Integer.parseInt(request.getParameter("maNhanVien"));
        try {
            iEmployeeService.deleteEmployee(maNhanVien);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Employee> employeeList = iEmployeeService.selectAllEmployee();
        List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
        List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
        List<Position> positionList = employeePositionService.selectAllEmployeePosition();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("levelList",levelList);
        request.setAttribute("positionList",positionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);

    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maNhanVien = Integer.parseInt(request.getParameter("maNhanVien"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String soCMND = request.getParameter("soCMND");
        double luong = Double.parseDouble(request.getParameter("luong"));
        String soDT = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        int maTrinhDo = Integer.parseInt(request.getParameter("maTrinhDo"));
        int maBoPhan = Integer.parseInt(request.getParameter("maBoPhan"));
        int maViTri = Integer.parseInt(request.getParameter("maViTri"));
        Employee employee = new Employee(maNhanVien,hoTen,ngaySinh,soCMND,luong,soDT,email,
                diaChi,maTrinhDo,maBoPhan,maViTri);
        try {
            iEmployeeService.updateEmployee(employee);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<Employee> employeeList = iEmployeeService.selectAllEmployee();
        List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
        List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
        List<Position> positionList = employeePositionService.selectAllEmployeePosition();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("levelList",levelList);
        request.setAttribute("positionList",positionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int maNhanVien = Integer.parseInt(request.getParameter("maNhanVien"));
        List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
        request.setAttribute("departmentList",departmentList);
        List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
        request.setAttribute("levelList",levelList);
        List<Position> positionList = employeePositionService.selectAllEmployeePosition();
        request.setAttribute("positionList",positionList);
        Employee employee = iEmployeeService.selectEmployee(maNhanVien);
        request.setAttribute("employee",employee);
        request.getRequestDispatcher("view/employee/edit.jsp").forward(request,response);
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String soCMND = request.getParameter("soCMND");
        double luong = Double.parseDouble(request.getParameter("luong"));
        String soDT = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        int maTrinhDo = Integer.parseInt(request.getParameter("maTrinhDo"));
        int maBoPhan = Integer.parseInt(request.getParameter("maBoPhan"));
        int maViTri = Integer.parseInt(request.getParameter("maViTri"));
        Employee employee = new Employee(hoTen,ngaySinh,soCMND,luong,soDT,email,diaChi,maTrinhDo,maBoPhan,maViTri);
        iEmployeeService.insertEmployee(employee);

        List<Employee> employeeList = iEmployeeService.selectAllEmployee();
        List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
        List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
        List<Position> positionList = employeePositionService.selectAllEmployeePosition();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("levelList",levelList);
        request.setAttribute("positionList",positionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Employee> employeeList = iEmployeeService.selectAllEmployee();
        List<Department> departmentList = employeeDepartmentService.selectAllEmployeeDepartment();
        List<Level> levelList = employeeLevelService.selectAllEmployeeLevel();
        List<Position> positionList = employeePositionService.selectAllEmployeePosition();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("departmentList",departmentList);
        request.setAttribute("levelList",levelList);
        request.setAttribute("positionList",positionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);

    }
}
