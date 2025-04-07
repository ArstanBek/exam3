package com.example.exam3.demo3.repositories;

import com.example.exam3.demo3.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository<Role, String> {
    Optional<Object> findByRoleName(String roleName);
}
