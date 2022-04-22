package service.impl.employee;

import model.employee.Position;
import repository.impl.employee.EmployeePositionRepositoryImpl;

import java.util.List;

public class EmployeePositionServiceImpl {
    EmployeePositionRepositoryImpl employeePositionRepository = new EmployeePositionRepositoryImpl();
    public List<Position> selectAllEmployeePosition(){
        List<Position> positionList = employeePositionRepository.selectAllEmployeePosition();
        return positionList;
    }
}
