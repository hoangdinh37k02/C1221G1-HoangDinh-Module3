package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerRepositoryImpl implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertCustomer(Customer customer) {
        try {
            PreparedStatement preparedStatement =this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, emai, dia_chi) values (?,?,?,?,?,?,?,?);");
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setString(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
