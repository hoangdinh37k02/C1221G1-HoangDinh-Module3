package service.impl.employee;

import model.customer.CustomerType;
import model.employee.Department;
import repository.impl.customer.CustomerTypeRepositoryImpl;
import repository.impl.employee.EmployeeDepartmentRepositoryImpl;

import java.util.List;

public class EmployeeDepartmentServiceImpl {
    EmployeeDepartmentRepositoryImpl employeeDepartmentRepository = new EmployeeDepartmentRepositoryImpl();

    public List<Department> selectAllEmployeeDepartment() {
        List<Department> departmentList = employeeDepartmentRepository.selectAllEmployeeDepartment();
        return departmentList;
    }
}
