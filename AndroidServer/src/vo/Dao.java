package vo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dao {
	public static Connection con;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.url, Common.id, Common.pw);
			System.out.println("�����ͺ��̽� ���� ����");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
}
