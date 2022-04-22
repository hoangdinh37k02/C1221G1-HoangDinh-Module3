package repository.impl.employee;

import model.customer.CustomerType;
import model.employee.Department;
import repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDepartmentRepositoryImpl {
    BaseRepository baseRepository = new BaseRepository();

    public List<Department> selectAllEmployeeDepartment() {
        List<Department> departmentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnectionJavaToDB()
                    .prepareStatement("select * from bo_phan");
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                int maBoPhan = rs.getInt("ma_bo_phan");
                String tenBoPhan = rs.getString("ten_bo_phan");

                departmentList.add(new Department(maBoPhan,tenBoPhan));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departmentList;
    }
}
