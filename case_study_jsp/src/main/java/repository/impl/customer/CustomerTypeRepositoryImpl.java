package repository.impl.customer;

import model.customer.CustomerType;
import repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepositoryImpl {
    BaseRepository baseRepository = new BaseRepository();

    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from loai_khach");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maLoaiKhach = rs.getInt("ma_loai_khach");
                String tenLoaiKhach = rs.getString("ten_loai_khach");

                customerTypeList.add(new CustomerType(maLoaiKhach,tenLoaiKhach));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
