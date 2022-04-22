package service.impl.employee;

import model.employee.Level;
import repository.impl.employee.EmployeeLevelRepositoryImpl;

import java.util.List;

public class EmployeeLevelServiceImpl {
    EmployeeLevelRepositoryImpl employeeLevelRepository = new EmployeeLevelRepositoryImpl();

    public List<Level> selectAllEmployeeLevel(){
        List<Level> levelList = employeeLevelRepository.selectAllEmployeeLevel();
        return levelList;
    }
}
