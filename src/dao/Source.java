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
import beans.Sources;

public class Source {
	
	/**
	 * @param table_name 数据表名称
	 * @return
	 */
	public static List<Sources> getPageResult(String table_name, int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		List<Sources> list_source = new ArrayList<Sources>();
		int totalPage = pageSize * (page - 1);
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from " + table_name + " order by id asc limit "+totalPage+","+pageSize);
			while(rs.next()){
				Sources source = new Sources();
				
				source.setId(rs.getInt("id"));
				source.setTitle(rs.getString("title"));
				source.setFileName(rs.getString("fileName"));
				source.setUn(rs.getString("un"));
				source.setCourse_id(rs.getInt("course_id"));
				source.setTime(rs.getDate("time"));
				
				list_source.add(source);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_source;
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
	
	public static int getCountByUn(String un) {
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from mysql_source,sqlserver_source,oracle_source " +
					"where mysql_source.un="+un+" and sqlserver_source.un="+un+" and oracle_source.un="+un);
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
	 * @param source
	 * @param kind
	 * @return
	 */
	public static int add(Sources source, String kind){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "insert into " + kind + "(id,fileName,un,time,course_id,title) values(?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, source.getId());
			ps.setString(2, source.getFileName());
			ps.setString(3, source.getUn());
			ps.setDate(4, source.getTime());
			ps.setInt(5, source.getCourse_id());
			ps.setString(6, source.getTitle());
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

	public static int userDelete(int id,String filename){
		int result = 0;
		String table_name[] = {"mysql_source","sqlserver_source","oracle_source"};
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			String name;
			String sql;
			ResultSet rs;
			for(int i=0; i<3; i++){
				name = table_name[i];
				sql = "select * from " + name + " where id='" + id + "'";
				rs = cs.executeQuery(sql);
				while(rs.next()){
					Sources source = new Sources();
					source.setId(rs.getInt("id"));
					source.setFileName(rs.getString("fileName"));
					source.setKind(name);
					if(source.getFileName().equals(filename)){
						result = cs.executeUpdate("delete from " + name + " where id='" + source.getId() + "'");
						return result;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static void delFile(String filename){
		File fimage = new File(filename);
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
	public static Sources queryById(int id,String kind){
		Sources source = new Sources();
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from " + kind + " where id='" + id + "'");
			
			while(rs.next()){
				source.setId(rs.getInt("id"));
				source.setTitle(rs.getString("title"));
				source.setFileName(rs.getString("fileName"));
				source.setUn(rs.getString("un"));
				source.setCourse_id(rs.getInt("course_id"));
				source.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return source;
	}
	
	public static List<Sources> queryByCourseId(int course_id,String kind){
		List<Sources> list = new ArrayList<Sources>();
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from " + kind + " where course_id='" + course_id + "'");
			
			while(rs.next()){
				Sources source = new Sources();
				source.setId(rs.getInt("id"));
				source.setTitle(rs.getString("title"));
				source.setFileName(rs.getString("fileName"));
				source.setUn(rs.getString("un"));
				source.setCourse_id(rs.getInt("course_id"));
				source.setTime(rs.getDate("time"));
				
				list.add(source);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list;
	}
	
	/**
	 * 通过上传文件的用户查找
	 * @param un
	 * @return
	 */
	public static List<Sources> queryByUn(String un, int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		List<Sources> list_source = new ArrayList<Sources>();
		int totalPage = pageSize * (page - 1);
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from mysql_source where un='" + un + "' UNION ALL " +
					"select * from sqlserver_source where un='" + un + "' UNION ALL " +
					"select * from oracle_source where un='" + un + "' order by id asc limit "+totalPage+","+pageSize;
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Sources source = new Sources();

				source.setId(rs.getInt("id"));
				source.setTitle(rs.getString("title"));
				source.setFileName(rs.getString("fileName"));
				source.setUn(rs.getString("un"));
				source.setCourse_id(rs.getInt("course_id"));
				source.setTime(rs.getDate("time"));
				
				list_source.add(source);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_source;
	}
	
	/**
	 * @param value1 
	 * @param value2 
	 * @param value3 
	 * @return
	 */
	public List<Sources> queryCourse(){
		Connection conn = ConnectionGS.getConnection();
		List<Sources> list_source = new ArrayList<Sources>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from mysql_course UNION ALL " +
					"select * from sqlserver_course UNION ALL " +
					"select * from oracle_course";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Sources source = new Sources();

				source.setId(rs.getInt("id"));
				source.setTitle(rs.getString("title"));
				source.setFileName(rs.getString("fileName"));
				source.setUn(rs.getString("un"));
				source.setCourse_id(rs.getInt("course_id"));
				source.setTime(rs.getDate("time"));
				
				list_source.add(source);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_source;
	}
	
	/**
	 * 
	 * @param resource 需要更新到数据表的数据
	 * @param id 用来判断哪行
	 * @param kind 用来判断数据表
	 * @return
	 */
	public static int update(Sources source,int id,String kind){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		String sql = "update " + kind + " set fileName=?,un=?,time=?,course_id=?,title=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, source.getFileName());
			ps.setString(2, source.getUn());
			ps.setDate(3, source.getTime());
			ps.setInt(4, source.getCourse_id());
			ps.setString(5, source.getTitle());
			ps.setInt(6, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
}