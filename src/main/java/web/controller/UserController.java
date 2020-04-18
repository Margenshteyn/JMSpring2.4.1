package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import web.model.Role;
import web.model.User;
import web.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/")
public class UserController {
    /*    @Autowired
        private PasswordEncoder passwordEncoder;*/
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private UserService userService;

    /* public UserController(PasswordEncoder passwordEncoder, UserService userService) {
         this.passwordEncoder = passwordEncoder;
         this.userService = userService;
     }*/
    @GetMapping("/admin/userAdd")
    public String addUser(ModelMap model, User user) {
        System.out.println(user.getAmount());
        if ("".equals(user.getAmount())) {
            model.addAttribute("message", "Amount couldn't be empty!");
        } else if ("".equals(user.getUsername())) {
            model.addAttribute("message", "Login field couldn't be empty!");
        } else if (userService.addUser(user)) {
            model.addAttribute("message", "User: " + user.getUsername() + " added!");
        } else {
            model.addAttribute("message", "User: " + user.getUsername() + " not added - user already exist!");
        }
        return "redirect:/admin/list";
    }

    @GetMapping("/admin/userDelete")
//	public String deleteUser(ModelMap model, @RequestParam String login) {
    public String deleteUser(ModelMap model, String login) {
        userService.deleteUser(login);
        model.addAttribute("message", "User: " + login + " deleted!");
        return "redirect:/admin/list";
    }

    @GetMapping("/admin/list")
    public String getAllUsers(ModelMap model) {
        model.addAttribute("usersList", userService.getUsersList());
        return "list";
    }

    @GetMapping("/admin/userUpdate")
//    public String getUpdateForm(ModelMap model, @RequestParam String login) {
    public String getUpdateForm(ModelMap model, String login) {
        model.addAttribute("user", userService.getUserByLogin(login));
        return "userUpdate";
    }

    @PostMapping("/admin/userUpdate")
//    public String updateUser(ModelMap model, String password, String newLogin, String newPassword, String newName, double newAmount, Set<Role> newRoles) {
    public String updateUser(ModelMap model, User user, String newPassword) {
//        System.out.println(user);
//        String login = user.getUsername();
//        User newUser = new User(login, newPassword, user.getName(), user.getAmount(), user.getRoles());
        User newUser = new User(user.getUsername(), newPassword, user.getName(), user.getAmount(), user.getRoles());
        if (userService.updateUser(newUser, user.getPassword())) {
//            model.addAttribute("message", "User: " + newLogin + " updated!");
            model.addAttribute("message", "User: " + user.getUsername() + " updated!");
        } else {
//            model.addAttribute("message", "User: " + newLogin + " not updated - login/password wrong!");
            model.addAttribute("message", "User: " + user.getUsername() + " not updated - login/password wrong!");
        }
        return "redirect:/admin/list";
    }

    @GetMapping("login")
    public String loginPage() {
        Set<Role> roles = new HashSet<>();
        roles.add(new Role("ADMIN"));
        userService.addUser(new User("admin", "admin", "Max", 7777777, roles));
        return "login";
    }

    @GetMapping("user")
    public String getUser(ModelMap model, HttpSession session) {
        model.addAttribute("user", session.getAttribute("user"));
        return "user";
    }
}
