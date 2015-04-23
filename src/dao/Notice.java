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
	
	public static List<Notices> getPageResult(int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		int totalPage = pageSize * (page - 1);
		List<Notices> list_notice = new ArrayList<Notices>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from notice order by time desc limit "+totalPage+","+pageSize);
			while(rs.next()){
				Notices notice = new Notices();
				notice.setId(rs.getInt("id"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setUn(rs.getString("un"));
				notice.setTime(rs.getDate("time"));
				
				list_notice.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_notice;
	}
	
	public static int getCount(){
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from notice");
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
	
	public int add(Notices notice){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("insert into notice(title,content,un,time) values(?,?,?,?)");
			
			ps.setString(1, notice.getTitle());
			ps.setString(2, notice.getContent());
			ps.setString(3, notice.getUn());
			ps.setDate(4, notice.getTime());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static int delete(int id){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from notice where id='" + id + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static Notices queryById(int id){
		Notices notice = new Notices();
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from notice where id='" + id + "'");
			
			while(rs.next()){
				notice.setId(rs.getInt("id"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setUn(rs.getString("un"));
				notice.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return notice;
	}
	
	public static int update(Notices notice){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("update notice set title=?,content=?,un=?,time=? where id=?");
			
			ps.setString(1, notice.getTitle());
			ps.setString(2, notice.getContent());
			ps.setString(3, notice.getUn());
			ps.setDate(4, notice.getTime());
			ps.setInt(5, notice.getId());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
}