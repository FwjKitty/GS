package dao;

import java.io.File;
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
		} finally {
			ConnectionGS.close();
		}
		return list_user;
	}
	
	public static int add(Users user){
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try{
			pstmt = conn.prepareStatement("insert into user(un,pw,name,head,contact,introduction,time) values(?,?,?)");
			
			pstmt.setString(1, user.getUn());
			pstmt.setString(2, user.getPw());
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getHead());
			pstmt.setString(1, user.getContact());
			pstmt.setString(2, user.getIntroduction());
			pstmt.setDate(3, user.getTime());
			
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static int delete(String un){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from user where un='" + un + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static Users queryByUn(String un){
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
		} finally {
			ConnectionGS.close();
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
		} finally {
			ConnectionGS.close();
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
		int totalPage = pageSize * (page - 1) + 1;
		String sql = "select * from user order by time desc limit " + totalPage + ","+ pageSize + "";
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
		} finally {
			ConnectionGS.close();
		}
		return list;
	}
	
	public static int getCount(){
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from user");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static void delFile(String head){
		File fhead = new File(head);
		if(fhead.exists()){
			fhead.delete();
			System.out.println("删除资源文件完成！");
		}else{
			System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功!");
		}
	}
}