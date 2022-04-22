package service.impl.employee;

import model.employee.Employee;
import repository.ICustomerRepository;
import repository.IEmployeeRepository;
import repository.impl.employee.EmployeeRepositoryImpl;
import service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements IEmployeeService {
    private IEmployeeRepository iEmployeeRepository = new EmployeeRepositoryImpl();

    @Override
    public void insertEmployee(Employee employee) {
        iEmployeeRepository.insertEmployee(employee);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = iEmployeeRepository.selectAllEmployee();
        return employeeList;
    }

    @Override
    public Employee selectEmployee(int maNhanVien) {
        Employee employee = iEmployeeRepository.selectEmployee(maNhanVien);
        return employee;
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        iEmployeeRepository.updateEmployee(employee);
        return false;
    }

    @Override
    public boolean deleteEmployee(int maNhanVien) throws SQLException {
        iEmployeeRepository.deleteEmployee(maNhanVien);
        return false;
    }

    @Override
    public List<Employee> searchByName(String name) {
        List<Employee> employeeList = iEmployeeRepository.searchByName(name);
        return employeeList;
    }
}
