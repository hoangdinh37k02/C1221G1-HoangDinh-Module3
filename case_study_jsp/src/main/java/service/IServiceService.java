package service;

import model.service.Service;

import java.util.List;

public interface IServiceService {
    void insertService(Service service);
    List<Service> selectAllService();
}
