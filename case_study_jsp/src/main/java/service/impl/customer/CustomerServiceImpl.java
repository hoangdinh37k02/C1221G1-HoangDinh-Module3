package service.impl.customer;

import model.customer.Customer;
import repository.impl.customer.CustomerRepositoryImpl;
import service.ICustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {
    CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();
//    @Override
//    public void insertCustomer(Customer customer) {
//
//        customerRepository.insertCustomer(customer);
//    }

    @Override
    public Map<String, String> insertCustomer(Customer customer) {
        Map<String, String>map = new HashMap<>();
        if (customer.getHoTen().equals("")){
            map.put("name","Không để trống");
        } else if (!customer.getHoTen().matches("^\\p{L}+[0-9]*( (\\p{L}|[0-9])+)*$")){
            map.put("name","tên không hợp lệ");
        }

        if (!customer.getSoCMND().matches("^([0-9]{9})|([0-9]{12})$")){
            map.put("soCMND","Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9)");
        }

        if (!customer.getSoDienThoai().matches("^([0][9][0][0-9]{7})|([0][9][1][0-9]{7})$")){
            map.put("soDT","Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx");
        }

        if (!customer.getEmail().matches("([a-z]\\w+@[a-z]{2,}\\.)\\w{2,10}(\\.\\w{2,3})?")){
            map.put("email","Địa chỉ email phải đúng định dạng email");

        }
        if (map.isEmpty()){
            customerRepository.insertCustomer(customer);
        }
        return map;
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

    @Override
    public List<Customer> searchByName(String name, String email, String maLoaiKhach) {
        List<Customer> customerList = customerRepository.searchByName(name,email,maLoaiKhach);
        return customerList;
    }
}
