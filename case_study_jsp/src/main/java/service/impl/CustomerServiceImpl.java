package service.impl;

import model.Customer;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();
    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = customerRepository.selectAllCustomer();
        return customerList;
    }

    @Override
    public Customer selectCustomer(int maKhachHang) {
        Customer customer = customerRepository.selectCustomer(maKhachHang);
        return customer;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        customerRepository.updateCustomer(customer);
        return false;
    }

    @Override
    public boolean deleteCustomer(int maKhachHang) throws SQLException {
        customerRepository.deleteCustomer(maKhachHang);
        return false;
    }
}
