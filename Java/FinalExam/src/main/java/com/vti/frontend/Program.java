package com.vti.frontend;

import com.vti.Ultis.ScannerUtils;
import com.vti.entity.User;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

public class Program {
	public static void main(String[] args)
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		menuLogin();
	}

	private static void menuLogin() throws  ClassNotFoundException, IOException, SQLException {
//		Function function = new Function();
//		System.out.println("MỜI BẠN LOGIN");
//		User user = function.login();
//		System.out.println("Login successfull!");
//		System.out.println("Chào mừng " + user.getFullName() + "!");
		menuUser();
	}



	private static void menuUser() throws SQLException, ClassNotFoundException, IOException {
		Function function = new Function();
		System.out.println("Moi ban nhap chuc nang muon su dung:\n" + "1: In ra danh sách các User\n"
				+ "2: Tìm user theo ID\n" + "3: Xóa user theo id\n" + "4: Login\n" + "5: Thoat khoi chuong trinh\n ");

		while (true) {
			System.out.print("Moi ban nhap chuc nang: ");
			int choose = ScannerUtils.inputFunction(1, 5, "Ban chi duoc chon tu 1 --> 5. Mời nhập lại!");

			switch (choose) {
				case 1:
					function.getListUser();
					break;
				case 2:
					function.login();
					break;
				case 3:
					System.out.println("bạn đã thoát khỏi chương trình!");
					return;
			}
		}
	}

}
