package dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionGS;
import beans.GuideCourses;

public class GuideCourse {

	public static int addGuideCourse(GuideCourses guideCourse){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "insert into course(id, name, title, image, introduce) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, guideCourse.getId());
			ps.setString(2, guideCourse.getName());
			ps.setString(3, guideCourse.getTitle());
			ps.setString(4, guideCourse.getImage());
			ps.setString(5, guideCourse.getIntroduce());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static int del(int id){
		Connection conn = ConnectionGS.getConnection();
		String sql = "delete from course where id="+id;
		int result = 0;
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnectionGS.close();
		}
		return result;
	}
	
	public static void delFile(String image){
		File fimage = new File(image);
		if(fimage.exists()){
			fimage.delete();
			System.out.println("删除资源文件完成！ ");
		}else{
			System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
		}
	}
	
	public static GuideCourses queryById(int id){
		GuideCourses guideCourse = new GuideCourses();
		Connection conn = ConnectionGS.getConnection();
		String sql = "select * from course where id="+id;
		
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery(sql);
			while(rs.next()){
				guideCourse.setId(rs.getInt("id"));
				guideCourse.setName(rs.getString("name"));
				guideCourse.setTitle(rs.getString("title"));
				guideCourse.setImage(rs.getString("image"));
				guideCourse.setIntroduce(rs.getString("introduce"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnectionGS.close();
		}
		return guideCourse;
	}
	
	public static List<GuideCourses> getPageResult(int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		int totalPage = pageSize * (page - 1);
		List<GuideCourses> list_guideCourse = new ArrayList<GuideCourses>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from course order by id desc limit "+totalPage+","+pageSize);
			
			while(rs.next()){
				GuideCourses guideCourse = new GuideCourses();
				guideCourse.setId(rs.getInt("id"));
				guideCourse.setName(rs.getString("name"));
				guideCourse.setTitle(rs.getString("title"));
				guideCourse.setImage(rs.getString("image"));
				guideCourse.setIntroduce(rs.getString("introduce"));
				list_guideCourse.add(guideCourse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_guideCourse;
	}
	
	public static int getCount() {
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from course");
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
	
	public static List<GuideCourses> getPageResult(String name, int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		int totalPage = pageSize * (page - 1);
		List<GuideCourses> list_guideCourse = new ArrayList<GuideCourses>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from course where name='"+name+"' order by id desc limit "+totalPage+","+pageSize);
			
			while(rs.next()){
				GuideCourses guideCourse = new GuideCourses();
				guideCourse.setId(rs.getInt("id"));
				guideCourse.setName(rs.getString("name"));
				guideCourse.setTitle(rs.getString("title"));
				guideCourse.setImage(rs.getString("image"));
				guideCourse.setIntroduce(rs.getString("introduce"));
				list_guideCourse.add(guideCourse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_guideCourse;
	}
	
	public static int getCount(String name) {
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from course where name='"+name+"'");
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
	
	public static int update(GuideCourses guideCourse){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "update course set name=?, title=?, image=?, introduce=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, guideCourse.getName());
			ps.setString(2, guideCourse.getTitle());
			ps.setString(3, guideCourse.getImage());
			ps.setString(4, guideCourse.getIntroduce());
			ps.setInt(5, guideCourse.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
}