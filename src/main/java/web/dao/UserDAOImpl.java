package web.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import web.model.User;

import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public boolean validateUser(String login, String password) {
        User user = getUserByLogin(login);
        if (user != null) {
            return passwordEncoder.matches(password, user.getPassword());// ВАЖЕН порядок!!! сначала обычный потом кодированный("test4", $2a$10$Ivh69UhSnS8KCx2Ymph7Cenc1ARRJoepNP5RmHD5VkghN.W.GYttG);
        }
        return false;
    }

    @Override
    public User getUserByLogin(String login) {
        return sessionFactory.openSession().get(User.class, login);
    }

    @Override
    public void addUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void updateUser(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    @Override
    public void deleteUser(String login) {
//        sessionFactory.getCurrentSession().delete(getUserByLogin(login));
        sessionFactory.getCurrentSession().delete(sessionFactory.getCurrentSession().get(User.class, login));
    }

    @Override
    public List<User> getAllUsers() {
//        return (List<User>) sessionFactory.openSession().createQuery("From User").getResultList();
        TypedQuery<User> query = sessionFactory.getCurrentSession().createQuery("FROM User");
        return query.getResultList();
    }
}
