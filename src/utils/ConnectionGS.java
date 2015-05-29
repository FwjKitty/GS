package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionGS {
	
	private static Connection conn = null;
	private static String clazz = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/gs?characterEncoding=UTF8";
	private static String user = "gs_f";
	private static String password = "fwjlqhhzr";
	
	public static Connection getConnection(){
		try {
			Class.forName(clazz);
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("数据库链接失败！");
		}
		return conn;
	}
	
	public static void close() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}