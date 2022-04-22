package service.impl.customer;

import model.customer.CustomerType;
import repository.impl.customer.CustomerTypeRepositoryImpl;

import java.util.List;

public class CustomerTypeServiceImpl {
    CustomerTypeRepositoryImpl customerTypeRepository = new CustomerTypeRepositoryImpl();

    public List<CustomerType> selectAllCustomerType() {
        List<CustomerType> customerTypeList = customerTypeRepository.selectAllCustomerType();
        return customerTypeList;
    }
}
