package com.klef.jfsd.project.service;

import java.util.List;

import com.klef.jfsd.project.model.Faculty;
import com.klef.jfsd.project.model.Project;

public interface ProjectService {
   // Add a new project
   public String addProject(Project project);

   // View all projects
   public List<Project> viewAllProjects();

   // View a project by its ID
   public Project viewProjectById(int projectId);

   // View all projects by a specific student ID
   public List<Project> viewProjectsByStudentId(int studentId);

   // View project by project number
   public Project viewProjectByProjectNumber(String projectNumber);

   // View projects by project name
   public List<Project> viewProjectsByName(String name);
   
   public List<Project> findProjectsByFaculty(Faculty faculty);
   
   
}
