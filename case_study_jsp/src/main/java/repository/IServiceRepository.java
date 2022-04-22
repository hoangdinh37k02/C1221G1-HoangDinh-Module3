package repository;

import model.service.Service;

import java.util.List;

public interface IServiceRepository {
    void insertService(Service service);
    List<Service> selectAllService();
}
