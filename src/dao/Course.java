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
import beans.Courses;

public class Course {
	
	/**
	 * @param table_name 数据表名称
	 * V-video W-word S=soft
	 * @return
	 */
	public static List<Courses> getPageResult(String table_name, int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		List<Courses> list_course = new ArrayList<Courses>();
		int totalPage = pageSize * (page - 1);
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from " + table_name + " order by time desc limit "+totalPage+","+pageSize);
			while(rs.next()){
				Courses course = new Courses();
				
				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setIntroduction(rs.getString("introduction"));
				course.setFileName(rs.getString("fileName"));
				course.setImage(rs.getString("image"));
				course.setUn(rs.getString("un"));
				course.setTime(rs.getDate("time"));
				
				list_course.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_course;
	}
	
	public static int getCount(String kind) {
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from "+kind);
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
	
	/**
	 * 添加资源，所以还要通过king的值来确定数据表
	 * @param resource
	 * @param kind
	 * @return
	 */
	public static int add(Courses course, String kind){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "insert into " + kind + "(id,name,introduction,fileName,image,un,time) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, course.getId());
			ps.setString(2, course.getName());
			ps.setString(3, course.getIntroduction());
			ps.setString(4, course.getFileName());
			ps.setString(5, course.getImage());
			ps.setString(6, course.getUn());
			ps.setDate(7, course.getTime());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	/**
	 * 通过id来删除，所以还要通过king的值来确定数据表
	 * @param id
	 * @param kind 用来判断数据表
	 * @return
	 */
	public static int delete(int id,String kind){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from " + kind + " where id='" + id + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static void delFile(String filename, String image){
		File fname = new File(filename);
		File fimage = new File(image);
		if(fname.exists()){
			fname.delete();
			System.out.println("删除资源文件完成！ ");
		}else{
			System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
		}
		if(fimage.exists()){
			fimage.delete();
			System.out.println("删除资源文件完成！ ");
		}else{
			System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
		}
	}
	/**
	 * 通过id来查找，所以还要通过king的值来确定数据表
	 * @param id
	 * @param kind 用来判断数据表
	 * @return
	 */
	public static Courses queryById(int id,String kind){
		Courses course = new Courses();
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from " + kind + " where id='" + id + "'");
			
			while(rs.next()){
				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setIntroduction(rs.getString("introduction"));
				course.setFileName(rs.getString("fileName"));
				course.setImage(rs.getString("image"));
				course.setUn(rs.getString("un"));
				course.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return course;
	}
	
	/**
	 * 通过上传文件的用户查找
	 * @param un
	 * @return
	 */
	public List<Courses> querySource(String un){
		Connection conn = ConnectionGS.getConnection();
		List<Courses> list_course = new ArrayList<Courses>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from mysql_source where un='" + un + "' UNION ALL " +
					"select * from sqlserver_source where un='" + un + "' UNION ALL " +
					"select * from oracle_source where un='" + un + "' order by time desc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Courses course = new Courses();

				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setIntroduction(rs.getString("introduction"));
				course.setFileName(rs.getString("fileName"));
				course.setImage(rs.getString("image"));
				course.setUn(rs.getString("un"));
				course.setTime(rs.getDate("time"));
				
				list_course.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_course;
	}
	
	/**
	 * @param value1 
	 * @param value2 
	 * @param value3 
	 * @return
	 */
	public List<Courses> queryCourse(){
		Connection conn = ConnectionGS.getConnection();
		List<Courses> list_course = new ArrayList<Courses>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from mysql_course UNION ALL " +
					"select * from sqlserver_course UNION ALL " +
					"select * from oracle_course order by time desc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Courses course = new Courses();

				course.setId(rs.getInt("id"));
				course.setName(rs.getString("name"));
				course.setIntroduction(rs.getString("introduction"));
				course.setFileName(rs.getString("fileName"));
				course.setImage(rs.getString("image"));
				course.setUn(rs.getString("un"));
				course.setTime(rs.getDate("time"));
				
				list_course.add(course);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_course;
	}
	
	/**
	 * 
	 * @param resource 需要更新到数据表的数据
	 * @param id 用来判断哪行
	 * @param kind 用来判断数据表
	 * @return
	 */
	public static int update(Courses course,int id,String kind){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		String sql = "update " + kind + " set name=?, introduction=?, fileName=?,image=?,un=?,time=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, course.getName());
			ps.setString(2, course.getIntroduction());
			ps.setString(3, course.getFileName());
			ps.setString(4, course.getImage());
			ps.setString(5, course.getUn());
			ps.setDate(6, course.getTime());
			ps.setInt(7, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
}