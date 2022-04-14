package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService{
    private static Map<Integer, Customer> customers;

    static {
        customers=new HashMap<>();
        customers.put(1, new Customer(1, "Son", "son@codegym.vn", "Hanoi"));
        customers.put(2, new Customer(2, "Hoang", "hoang@codegym.vn", "Danang"));
        customers.put(3, new Customer(3, "Quyen", "quyen@codegym.vn", "Saigon"));
        customers.put(4, new Customer(4, "Quynh", "quynh@codegym.vn", "QuangNam"));
        customers.put(5, new Customer(5, "Bao", "bao@codegym.vn", "Hue"));
        customers.put(6, new Customer(6, "Binh", "binh@codegym.vn", "HaiPhong"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
