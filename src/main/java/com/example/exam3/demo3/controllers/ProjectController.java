package com.example.exam3.demo3.controllers;

import com.example.exam3.demo3.dto.ProjectCreate;
import com.example.exam3.demo3.dto.ProjectResponse;
import com.example.exam3.demo3.model.Project;
import com.example.exam3.demo3.services.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/projects")
@RequiredArgsConstructor
public class ProjectController {
    private final ProjectService projectService;

    @GetMapping()
    public ResponseEntity<Page<ProjectResponse>> getAllProducts(
            Pageable pageable
    ) {
        Page<Project> products = projectService.getAllProjects(pageable);

        Page<ProjectResponse> productResponses = products.map(ProjectResponse::new);

        return ResponseEntity.ok(productResponses);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProjectResponse> getProduct (@PathVariable("id") Long id) {
        Project product = projectService.findById(id);
        ProjectResponse productResponse = new ProjectResponse(product);

        return ResponseEntity.ok(productResponse);
    }

    @PostMapping()
    public ResponseEntity<ProjectResponse> create(@RequestBody ProjectCreate request) {
        Project project = new Project(request);
        ProjectResponse productResponse = new ProjectResponse(projectService.createProject(project));
        return ResponseEntity.ok(productResponse);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteProduct(@PathVariable Long id) {
        projectService.deleteProjectById(id);
        ResponseEntity.ok().build();
        return null;
    }
}
