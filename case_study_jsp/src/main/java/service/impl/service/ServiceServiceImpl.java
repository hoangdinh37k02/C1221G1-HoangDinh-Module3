package service.impl.service;

import model.service.Service;
import repository.impl.service.ServiceRepositoryImpl;
import service.IServiceService;

import java.util.List;

public class ServiceServiceImpl implements IServiceService {
    ServiceRepositoryImpl serviceRepository = new ServiceRepositoryImpl();
    @Override
    public void insertService(Service service) {
        serviceRepository.insertService(service);

    }

    @Override
    public List<Service> selectAllService() {
        List<Service> serviceList = serviceRepository.selectAllService();
        return serviceList;
    }
}
