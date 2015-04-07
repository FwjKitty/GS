package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Users;

import utils.ConnectionGS;

public class User {
	
	public List<Users> select(){
		Connection conn = ConnectionGS.getConnection();
		List<Users> list_user = new ArrayList<Users>();
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from user order by time desc");
			while(rs.next()){
				Users user = new Users();
				
				user.setUn(rs.getString("un"));
				user.setPw(rs.getString("pw"));
				user.setHead(rs.getString("head"));
				user.setName(rs.getString("name"));
				user.setContact(rs.getString("contact"));
				user.setIntroduction(rs.getString("introduction"));
				user.setTime(rs.getDate("time"));
				list_user.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_user;
	}
	
	public int add(Users user){
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try{
			pstmt = conn.prepareStatement("insert into user(un,pw,time) values(?,?,?)");
			
			pstmt.setString(1, user.getUn());
			pstmt.setString(2, user.getPw());
			pstmt.setDate(3, user.getTime());
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String un){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from user where un='" + un + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Users query(String un){
		Users user = new Users();
		Connection conn = ConnectionGS.getConnection();
		ResultSet rs = null;
		try {
			Statement cs = conn.createStatement();
			rs = cs.executeQuery("select * from user where un='" + un +"'");
			
			while(rs.next()){
				user.setUn(rs.getString("un"));
				user.setPw(rs.getString("pw"));
				user.setContact(rs.getString("contact"));
				user.setHead(rs.getString("head"));
				user.setName(rs.getString("name"));
				user.setIntroduction(rs.getString("introduction"));
				user.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int update(String un,Users user){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		String sql = "update user set un=?,pw=?,head=?,name=?,contact=?,introduction=? where un=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, user.getUn());
			ps.setString(2, user.getPw());
			ps.setString(3, user.getHead());
			ps.setString(4, user.getName());
			ps.setString(5, user.getContact());
			ps.setString(6, user.getIntroduction());
			ps.setString(7, un);
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/**
	 * 分页
	 * @param pageSize 页面大小
	 * @param page 第几页
	 * @return 返回记录集
	 */
	public static List<Users> getPageResult(int pageSize, int page) {
		Connection conn = ConnectionGS.getConnection();
		//当前页面中的第一条数据的number
		int aa = pageSize * (page - 1) + 1;
		String sql = "select * from user order by time desc limit " + aa + ","+ pageSize + "";
		List<Users> list = new ArrayList<Users>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Users user = new Users();
				user.setUn(rs.getString("un"));
				user.setPw(rs.getString("pw"));
				user.setHead(rs.getString("head"));
				user.setName(rs.getString("name"));
				user.setContact(rs.getString("contact"));
				user.setIntroduction(rs.getString("introduction"));
				user.setTime(rs.getDate("time"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ConnectionGS.close();
		return list;
	}
}