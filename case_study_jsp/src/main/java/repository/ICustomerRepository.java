package repository;

import model.customer.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerRepository {
    void insertCustomer(Customer customer);
//    Map<String,String> insertCustomer(Customer customer);
    List<Customer> selectAllCustomer();
    public Customer selectCustomer(int maKhachHang);
    public boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int maKhachHang) throws SQLException;
    List<Customer> searchByName(String name, String email, String maLoaiKhach);
}
