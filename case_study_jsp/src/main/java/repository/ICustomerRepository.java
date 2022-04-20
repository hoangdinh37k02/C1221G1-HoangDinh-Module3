package repository;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    void insertCustomer(Customer customer);
    List<Customer> selectAllCustomer();
    public Customer selectCustomer(int maKhachHang);
    public boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int maKhachHang) throws SQLException;
}
