package service.impl;

import model.Customer;
import model.CustomerType;
import repository.impl.CustomerTypeRepositoryImpl;

import java.util.List;

public class CustomerTypeServiceImpl {
    CustomerTypeRepositoryImpl customerTypeRepository = new CustomerTypeRepositoryImpl();

    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypeList = customerTypeRepository.selectAllCustomerType();
        return customerTypeList;
    }
}
