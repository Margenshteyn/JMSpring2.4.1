package web.service;

import org.springframework.security.core.userdetails.UserDetails;
import web.model.User;

import java.util.List;

public interface UserService {

    public boolean addUser(User user);

    public boolean updateUser(User user, String password);

    public void deleteUser(String login);

    public List<User> getUsersList();

    public User getUserByLogin(String login);

}
