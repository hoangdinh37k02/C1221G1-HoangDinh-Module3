package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getList();
    void save(User user);
    User selectUser(Integer id);
    boolean updateUser(User user);
    boolean deleteUser(Integer id);
}
