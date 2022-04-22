package repository.impl.employee;

import model.customer.Customer;
import model.employee.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertEmployee(Employee employee) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dt," +
                            "email,dia_chi,ma_trinh_do,ma_bo_phan,ma_vi_tri) values (?,?,?,?,?,?,?,?,?,?);");
            preparedStatement.setString(1,employee.getHoTen());
            preparedStatement.setString(2,employee.getNgaySinh());
            preparedStatement.setString(3,employee.getSoCMND());
            preparedStatement.setDouble(4,employee.getLuong());
            preparedStatement.setString(5,employee.getSoDT());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getDiaChi());
            preparedStatement.setInt(8,employee.getMaTrinhDo());
            preparedStatement.setInt(9,employee.getMaBoPhan());
            preparedStatement.setInt(10,employee.getMaViTri());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from nhan_vien");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maNhanVien = rs.getInt("ma_nhan_vien");
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                String soCMND = rs.getString("so_cmnd");
                double luong = rs.getDouble("luong");
                String soDienThoai = rs.getString("so_dt");
                String email = rs.getString("email");
                String diaChi = rs.getString("dia_chi");
                int maTrinhDo = rs.getInt("ma_trinh_do");
                int maBoPhan = rs.getInt("ma_bo_phan");
                int maViTri = rs.getInt("ma_vi_tri");
                employeeList.add(new Employee(maNhanVien,hoTen,ngaySinh,soCMND,luong,soDienThoai,
                        email,diaChi,maTrinhDo,maBoPhan,maViTri));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public Employee selectEmployee(int maNhanVien) {
        Employee employee= null;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from nhan_vien where ma_nhan_vien=?");
            preparedStatement.setInt(1,maNhanVien);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                String soCMND = rs.getString("so_cmnd");
                double luong = rs.getDouble("luong");
                String soDT = rs.getString("so_dt");
                String email = rs.getString("email");
                String diaChi = rs.getString("dia_chi");
                int maTrinhDo = rs.getInt("ma_trinh_do");
                int maBoPhan = rs.getInt("ma_bo_phan");
                int maViTri = rs.getInt("ma_vi_tri");
                employee = new Employee(maNhanVien,hoTen,ngaySinh,soCMND,luong,soDT,
                        email,diaChi,maTrinhDo,maBoPhan,maViTri);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employee;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdate = false;
        PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                .prepareStatement("update nhan_vien set ho_ten=?,ngay_sinh=?,so_cmnd=?,luong=?,so_dt=?,email=?," +
                        "dia_chi=?,ma_trinh_do=?,ma_bo_phan=?,ma_vi_tri=? where ma_nhan_vien=?;");
        preparedStatement.setString(1,employee.getHoTen());
        preparedStatement.setString(2,employee.getNgaySinh());
        preparedStatement.setString(3,employee.getSoCMND());
        preparedStatement.setDouble(4,employee.getLuong());
        preparedStatement.setString(5,employee.getSoDT());
        preparedStatement.setString(6,employee.getEmail());
        preparedStatement.setString(7,employee.getDiaChi());
        preparedStatement.setInt(8,employee.getMaTrinhDo());
        preparedStatement.setInt(9,employee.getMaBoPhan());
        preparedStatement.setInt(10,employee.getMaViTri());
        preparedStatement.setInt(11,employee.getMaNhanVien());
        rowUpdate = preparedStatement.executeUpdate()>0;
        return rowUpdate;
    }

    @Override
    public boolean deleteEmployee(int maNhanVien) throws SQLException {
        boolean rowdelete=false;
        PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                .prepareStatement("delete from nhan_vien where ma_nhan_vien=?");
        preparedStatement.setInt(1,maNhanVien);
        rowdelete = preparedStatement.executeUpdate()>0;

        return rowdelete;
    }

    @Override
    public List<Employee> searchByName(String name) {
        List<Employee> employeeList = this.selectAllEmployee();
        List<Employee> searchList = new ArrayList<>();
        for (Employee employee:employeeList) {
            if ((employee.getHoTen().toLowerCase()).contains(name)){
                searchList.add(employee);
            }
        }
        return searchList;
    }
}
