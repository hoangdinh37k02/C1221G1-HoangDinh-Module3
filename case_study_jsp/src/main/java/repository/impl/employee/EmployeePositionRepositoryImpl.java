package repository.impl.employee;

import model.employee.Level;
import model.employee.Position;
import repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeePositionRepositoryImpl {
    BaseRepository baseRepository = new BaseRepository();

    public List<Position> selectAllEmployeePosition() {
        List<Position> positionList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from vi_tri");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maViTri = rs.getInt("ma_vi_tri");
                String tenViTri = rs.getString("ten_vi_tri");

                positionList.add(new Position(maViTri,tenViTri));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }
}
