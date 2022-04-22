package repository.impl.employee;

import model.employee.Department;
import model.employee.Level;
import repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeLevelRepositoryImpl {
    BaseRepository baseRepository = new BaseRepository();

    public List<Level> selectAllEmployeeLevel() {
        List<Level> levelList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from trinh_do");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maTrinhDo = rs.getInt("ma_trinh_do");
                String tenTrinhDo = rs.getString("ten_trinh_do");

                levelList.add(new Level(maTrinhDo,tenTrinhDo));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return levelList;
    }
}
