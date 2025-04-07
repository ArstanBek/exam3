package com.example.exam3.demo3.services;

import com.example.exam3.demo3.model.User;

import java.util.List;

public interface UserService {
    User findById(Long id);
    User saveUser(User user);
    void deleteUserById(Long id);
    List<User> getAllUsers();
    User getByUsername(String username);
    User getCurrentUser();
}
