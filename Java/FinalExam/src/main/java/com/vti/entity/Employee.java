package com.vti.entity;

public class Employee extends User {

	private String ProSkill;
	private int projectId;

	public Employee(int id, String fullName, String email, String password, String ProSkill, int projectId) {
		super(id, fullName, email, password);
		this.ProSkill = ProSkill;
		this.projectId = projectId;
	}

	public void setProSkill(String proSkill) {
		ProSkill = proSkill;
	}

	@Override
	public String toString() {
		return "Employee [ProSkill=" + ProSkill +", ProjectId"+projectId+ ", getId()=" + getId() + ", getFullName()=" + getFullName()
				+ ", getEmail()=" + getEmail() + ", getPassword()=" + getPassword()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}

}
