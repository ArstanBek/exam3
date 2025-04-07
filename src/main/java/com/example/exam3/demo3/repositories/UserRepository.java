package com.example.exam3.demo3.repositories;

import com.example.exam3.demo3.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> getByUsername (String username);

    Optional<User> getByEmail(String email);
}