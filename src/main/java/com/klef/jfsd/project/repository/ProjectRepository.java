package com.klef.jfsd.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.project.model.Faculty;
import com.klef.jfsd.project.model.Project;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Integer> {

   // Find all projects by the student ID
   List<Project> findByStudentId(int studentId);

   // Find project by project number
   Project findByProjectNumber(String projectNumber);

   // Find projects by name (part of the name)
   List<Project> findByNameContainingIgnoreCase(String name);

   // Find all projects associated with a specific student
   List<Project> findByStudent_Name(String studentName);
   
   List<Project> findAll();
   
   List<Project> findByFaculty(Faculty faculty); 
   
   @Query("SELECT p FROM Project p WHERE p.id = :id")
   Project findProjectById(@Param("id") Long id); // Custom query to find project by ID
}
