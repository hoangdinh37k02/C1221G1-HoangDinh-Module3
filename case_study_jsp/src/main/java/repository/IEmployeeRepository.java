package repository;

import model.employee.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepository {
    void insertEmployee(Employee employee);
    List<Employee> selectAllEmployee();
    Employee selectEmployee(int maNhanVien);
    boolean updateEmployee(Employee employee) throws SQLException;
    boolean deleteEmployee(int maNhanVien) throws SQLException;
    List<Employee> searchByName(String name);
}
