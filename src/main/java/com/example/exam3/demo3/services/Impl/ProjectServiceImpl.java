package com.example.exam3.demo3.services.Impl;

import com.example.exam3.demo3.model.Project;
import com.example.exam3.demo3.model.User;
import com.example.exam3.demo3.services.ProjectService;
import com.example.exam3.demo3.repositories.ProjectRepository;
import com.example.exam3.demo3.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository projectRepository;
    private final UserService userService;

    @Override
    public Project findById(Long id) {
        return projectRepository.findById(id).orElse(null);
    }

    @Override
    public Project createProject(Project product) {
        User user = userService.getCurrentUser();
        product.setUser(user);
        return projectRepository.save(product);
    }

    @Override
    public void deleteProjectById(Long id) {

        User user = userService.getCurrentUser();
        Optional<Project> project = projectRepository.findById(id);

        if (user.getRoles().stream().anyMatch(role -> role.equals("ROLE_ADMIN"))) {
            projectRepository.deleteById(id);
        } else {
            if (project.get().getId().equals(id)) {
                projectRepository.deleteById(id);
            }
        }
    }

    @Override
    public Page<Project> getAllProjects(
           Pageable pageable
    ) {
        User user = userService.getCurrentUser();

        if (user.getRoles().stream().anyMatch(role -> role.equals("ROLE_ADMIN"))) {
            System.out.println("admin ?????");
            return projectRepository.findAll(pageable);
        } else {
            return projectRepository.findByUserId(user.getId(), pageable);
        }
    }
}
