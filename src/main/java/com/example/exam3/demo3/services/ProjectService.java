package com.example.exam3.demo3.services;

import com.example.exam3.demo3.model.Project;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ProjectService {
    Project findById(Long id);
    Project createProject(Project project);
    void deleteProjectById(Long id);
    Page<Project> getAllProjects(Pageable pageable);
}
