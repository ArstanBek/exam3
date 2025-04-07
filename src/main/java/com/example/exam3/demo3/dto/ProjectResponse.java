package com.example.exam3.demo3.dto;

import com.example.exam3.demo3.model.Project;
import com.example.exam3.demo3.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectResponse {
    private Long id;

    private String name;

    private String description;

    private UserResponse user;

    private LocalDateTime createdAt;

    private LocalDateTime updatedAt;

    public ProjectResponse(Project project) {
        this.id = project.getId();
        this.name = project.getName();
        this.description = project.getDescription();
        this.createdAt = project.getCreatedAt();
        this.updatedAt = project.getUpdatedAt();
        this.user = new UserResponse(project.getUser());
    }
}