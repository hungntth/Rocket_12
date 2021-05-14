package com.vti.entity;

public class Project {
    private int projectId;
    private String fullName;
    private String role;
    public Project(int projectId, String fullName, String role) {
        this.projectId = projectId;

        this.fullName = fullName;
        this.role = role;
    }


    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
