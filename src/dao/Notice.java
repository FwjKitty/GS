package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionGS;
import beans.Notices;

public class Notice {
	
	public List<Notices> select(){
		Connection conn = ConnectionGS.getConnection();
		List<Notices> list_notice = new ArrayList<Notices>();
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from notice order by time desc");
			while(rs.next()){
				Notices notice = new Notices();
				
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setTime(rs.getDate("time"));
				
				list_notice.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list_notice;
	}
	
	public int add(Notices notice){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("insert into notice(title,content,time) values(?,?,?)");
			
			ps.setString(1, notice.getTitle());
			ps.setString(2, notice.getContent());
			ps.setDate(3, notice.getTime());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String title){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from notice where title='" + title + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Notices query(String title){
		Notices notice = new Notices();
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from notice where title='" + title + "'");
			
			while(rs.next()){
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}
	
	public int update(Notices notice,String title){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("update notice set title=?,content=?,time=? where title=?");
			
			ps.setString(1, notice.getTitle());
			ps.setString(2, notice.getContent());
			ps.setDate(3, notice.getTime());
			ps.setString(4, title);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}