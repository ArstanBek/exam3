package com.example.exam3.demo3.services.Impl;


import com.example.exam3.demo3.model.Role;
import com.example.exam3.demo3.model.User;
import com.example.exam3.demo3.services.UserService;
import com.example.exam3.demo3.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;


    @Override
    public User findById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
    @Override
    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }
    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User getByUsername(String username) {
        return userRepository.getByUsername(username).orElseThrow(() -> new UsernameNotFoundException("Пользователь не найден"));
    }

    @Override
    public User saveUser(User myUser) {
        if (userRepository.getByUsername(myUser.getUsername()).isEmpty() && userRepository.getByEmail(myUser.getEmail()).isEmpty()) {
            myUser.setPassword(myUser.getPassword());
            myUser.setRoles(List.of(myUser.getRoles().toArray(new Role[0])));
            myUser.setEmail(myUser.getEmail());
            myUser.setEnabled(myUser.isEnabled());
            return userRepository.save(myUser);
        } else {
            throw new RuntimeException("Пользователь с такими данными уже существует");
        }
    }

    public UserDetailsService userDetailsService() {
        return this::getByUsername;
    }

    public User getCurrentUser() {
        // Получение имени пользователя из контекста Spring Security
        var username = SecurityContextHolder.getContext().getAuthentication().getName();
        return getByUsername(username);
    }

}
