package com.vti.frontend;

import com.vti.Ultis.ScannerUtils;
import com.vti.backend.presentation.UserController;
import com.vti.entity.Project;
import com.vti.entity.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class Function {

	private UserController userController;

	public Function() throws  ClassNotFoundException, IOException, SQLException {
		userController = new UserController();
	}

	public boolean getUserById() throws ClassNotFoundException, SQLException {
		while (true) {
			System.out.print("Mời bạn nhập vào id: ");
			int id = ScannerUtils.inputPositiveInt("Bạn phải nhập vào số nguyên dương! Mời nhập lại");

			if (userController.ProjectIdExits(id)) {
				List<Project> projects = userController.getUserById(id);
				System.out.printf("%-10s %-45s %-45s\n", "ID", "Email", "Fullname");
				for (Project project : projects) {
					System.out.printf("%-10s %-45s %-45s\n", project.getProjectId(), project.getFullName(), project.getRole());


				}return false;
			} else {
				System.err.println("Sai ID! Vui lòng nhập lại! ");
			}
		}
	}

	public void getListUser() throws ClassNotFoundException, SQLException {
		List<Project> projects = userController.getListUsers();
		System.out.printf("%-10s %-45s %-45s\n", "ID", "Email", "Fullname");
		for (Project project : projects) {
			System.out.printf("%-10s %-45s %-45s\n", project.getProjectId(), project.getFullName(), project.getRole());
		}
	}



	public User login() {
		while (true) {
			System.out.print("Mời bạn nhập vào Email của account: ");
			String email = ScannerUtils.inputEmail("Email chưa đúng định dạng.");

			System.out.print("Mời bạn nhập password: ");
			String password = ScannerUtils
					.inputPassword("Password từ 6 đến 12 ký tự, 1 ký tự viết hoa.");
			try {
				return userController.login(email, password);

			} catch (Exception e) {
				System.err.println(e.getMessage() + "\n");
			}
		}
	}
}
