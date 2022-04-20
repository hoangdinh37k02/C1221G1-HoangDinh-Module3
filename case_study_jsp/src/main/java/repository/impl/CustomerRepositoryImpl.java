package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertCustomer(Customer customer) {
        PreparedStatement preparedStatement =null;
        try {

             preparedStatement =this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dt, email, dia_chi) values (?,?,?,?,?,?,?,?);");
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setInt(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from khach_hang");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maKhachHang = rs.getInt("ma_khach_hang");
                int maLoaiKhach = rs.getInt("ma_loai_khach");
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                int gioiTinh = rs.getInt("gioi_tinh");
                String soCMND = rs.getString("so_cmnd");
                String soDienThoai = rs.getString("so_dt");
                String email = rs.getString("email");
                String diaChi = rs.getString("dia_chi");
                customerList.add(new Customer(maKhachHang,maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCMND,soDienThoai,email,diaChi));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer selectCustomer(int maKhachHang) {
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from khach_hang where ma_khach_hang=?");
            preparedStatement.setInt(1,maKhachHang);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int maLoaiKhach = rs.getInt("ma_loai_khach");
                String hoTen = rs.getString("ho_ten");
                String ngaySinh = rs.getString("ngay_sinh");
                int gioiTinh = rs.getInt("gioi_tinh");
                String soCMND = rs.getString("so_cmnd");
                String soDienThoai= rs.getString("so_dt");
                String email= rs.getString("email");
                String diaChi= rs.getString("dia_chi");
                customer = new Customer(maKhachHang,maLoaiKhach,hoTen,ngaySinh,gioiTinh,soCMND,soDienThoai,email,diaChi);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdate = false;
        PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                .prepareStatement("update khach_hang set ma_loai_khach=?,ho_ten=?,ngay_sinh=?,gioi_tinh=?," +
                        "so_cmnd=?,so_dt=?,email=?,dia_chi=? where ma_khach_hang=?;");
        preparedStatement.setInt(1,customer.getMaLoaiKhach());
        preparedStatement.setString(2,customer.getHoTen());
        preparedStatement.setString(3,customer.getNgaySinh());
        preparedStatement.setInt(4,customer.getGioiTinh());
        preparedStatement.setString(5,customer.getSoCMND());
        preparedStatement.setString(6,customer.getSoDienThoai());
        preparedStatement.setString(7,customer.getEmail());
        preparedStatement.setString(8,customer.getDiaChi());
        preparedStatement.setInt(9,customer.getMaKhachHang());
        rowUpdate=preparedStatement.executeUpdate()>0;
        return rowUpdate;
    }

    @Override
    public boolean deleteCustomer(int maKhachHang) throws SQLException {
        boolean rowdelete=false;
        PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                .prepareStatement("delete from khach_hang where ma_khach_hang=?");
        preparedStatement.setInt(1,maKhachHang);
        rowdelete = preparedStatement.executeUpdate()>0;

        return rowdelete;
    }
}
