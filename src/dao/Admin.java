package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Admins;

import utils.ConnectionGS;

public class Admin {
	
	public Admins queryByUn(String un){
		Admins admin = new Admins();
		String sql = "select * from admin where un="+un;
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery(sql);
			while(rs.next()){
				admin.setUn(rs.getString("un"));
				admin.setPw(rs.getString("pw"));
				admin.setValue(rs.getString("value"));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admin;
	}
}