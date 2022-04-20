package service;

import model.Customer;
import model.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    void insertCustomer(Customer customer);
    List<Customer> selectAllCustomer();
    Customer selectCustomer(int maKhachHang);
    boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int maKhachHang) throws SQLException;
}
