package repository.impl.service;

import model.service.Service;
import repository.BaseRepository;
import repository.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements IServiceRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertService(Service service) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue," +
                            "so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu,tieu_chuan_phong," +
                            "mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang) values (?,?,?,?,?,?,?,?,?,?);");
            preparedStatement.setString(1,service.getTenDichVu());
            preparedStatement.setInt(2,service.getDienTich());
            preparedStatement.setDouble(3,service.getChiPhiThue());
            preparedStatement.setInt(4,service.getSoNguoiToiDa());
            preparedStatement.setInt(5,service.getMaKieuThue());
            preparedStatement.setInt(6,service.getMaLoaiDichVu());
            preparedStatement.setString(7,service.getTieuChuanPhong());
            preparedStatement.setString(8,service.getTienNghiKhac());
            preparedStatement.setString(9,service.getDienTichHoBoi());
            preparedStatement.setInt(10,service.getSoTang());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Service> selectAllService() {
        List<Service> serviceList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from dich_vu");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maDichVu = rs.getInt("ma_dich_vu");
                String tenDichVu = rs.getString("ten_dich_vu");
                int dientich = rs.getInt("dien_tich");
                double chiPhiThue = rs.getDouble("chi_phi_thue");
                int soNguoiToiDa = rs.getInt("so_nguoi_toi_da");
                int maKieuThue = rs.getInt("ma_kieu_thue");
                int maLoaiDichVu = rs.getInt("ma_loai_dich_vu");
                String tieuChuanPhong = rs.getString("tieu_chuan_phong");
                String tienIchKhac = rs.getString("mo_ta_tien_nghi_khac");
                String dienTichHoBoi = rs.getString("dien_tich_ho_boi");
                int soTang = rs.getInt("so_tang");
                serviceList.add(new Service(maDichVu,tenDichVu,dientich,chiPhiThue,soNguoiToiDa,maKieuThue,
                        maLoaiDichVu,tieuChuanPhong,tienIchKhac,dienTichHoBoi,soTang));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }
}
