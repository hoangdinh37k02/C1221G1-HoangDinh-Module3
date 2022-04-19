package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepositoryImpl;
import service.IUserService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserRepository iUserRepository = new UserRepositoryImpl();

    @Override
    public List<User> getList() {
        List<User> userList = iUserRepository.getList();
        return userList;
    }

    @Override
    public void save(User user) {
        iUserRepository.save(user);
    }

    @Override
    public User selectUser(Integer id) {
        User user=iUserRepository.selectUser(id);
        return user;
    }

    @Override
    public boolean updateUser(User user) {
        iUserRepository.updateUser(user);
        return false;
    }

    @Override
    public boolean deleteUser(Integer id) {
        iUserRepository.deleteUser(id);
        return false;
    }
}
