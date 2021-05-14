package com.vti.frontend;

import com.vti.Ultis.ScannerUtils;
import com.vti.entity.User;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

public class Program {
	public static void main(String[] args)
			throws  ClassNotFoundException, IOException, SQLException {
		menuLogin();
	}

	private static void menuLogin() throws  ClassNotFoundException, IOException, SQLException {
		Function function = new Function();
		System.out.println("MỜI BẠN LOGIN");
		User user = function.login();
		System.out.println("Login successfull!");
		System.out.println("Chào mừng " + user.getFullName() + "!");
		menuUser();
	}



	private static void menuUser() throws SQLException, ClassNotFoundException, IOException {
		Function function = new Function();
		System.out.println("Moi ban nhap chuc nang muon su dung:\n" + "1: In ra tất cả các employee & Manager trong project\n"
				+ "2: In ra tất cả Manager của các project\n"  + "3: Đăng xuất\n" + "4: Thoát\n ");

		while (true) {
			System.out.print("Moi ban nhap chuc nang: ");
			int choose = ScannerUtils.inputFunction(1, 4, "Ban chi duoc chon tu 1 --> 4. Mời nhập lại!");

			switch (choose) {
				case 1:
					function.getUserById();
					break;
				case 2:
					function.getListUser();
					break;
				case 3:
					function.login();
					break;
				case 4:
					System.out.println("bạn đã thoát khỏi chương trình!");
					return;
			}
		}
	}

}
