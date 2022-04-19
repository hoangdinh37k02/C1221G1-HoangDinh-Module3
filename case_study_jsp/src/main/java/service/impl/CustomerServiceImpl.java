package service.impl;

import model.Customer;
import repository.impl.CustomerRepositoryImpl;
import service.ICustomerService;

public class CustomerServiceImpl implements ICustomerService {
    CustomerRepositoryImpl customerRepository = new CustomerRepositoryImpl();
    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.insertCustomer(customer);
    }
}
