package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> getList();
    void save(User user);
    User selectUser(Integer id);

    boolean updateUser(User user);

    boolean deleteUser(Integer id);
}
