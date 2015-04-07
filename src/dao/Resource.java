package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionGS;
import beans.Resources;

public class Resource {
	
	/**
	 * @param table_name 数据表名称
	 * V-video W-word S=soft
	 * @return
	 */
	public List<Resources> select(String table_name){
		Connection conn = ConnectionGS.getConnection();
		List<Resources> list_resource = new ArrayList<Resources>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from " + table_name + " order by time desc");
			while(rs.next()){
				Resources resource = new Resources();
				
				resource.setId(rs.getInt("id"));
				resource.setFileName(rs.getString("fileName"));
				resource.setUn(rs.getString("un"));
				resource.setTime(rs.getDate("time"));
				
				list_resource.add(resource);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_resource;
	}
	
	/**
	 * 添加资源，所以还要通过king的值来确定数据表
	 * @param resource
	 * @param kind
	 * @return
	 */
	public int add(Resources resource, String kind){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "insert into " + kind + " values(?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, resource.getId());
			ps.setString(2, resource.getFileName());
			ps.setString(3, resource.getUn());
			ps.setDate(4, resource.getTime());
			
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
	public int delete(int id,String kind){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from " + kind + " where id='" + id + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 通过id来查找，所以还要通过king的值来确定数据表
	 * @param id
	 * @param kind 用来判断数据表
	 * @return
	 */
	public Resources query(int id,String kind){
		Resources resource = new Resources();
		Connection conn = ConnectionGS.getConnection();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from " + kind + " where id='" + id + "'");
			
			while(rs.next()){
				resource.setId(rs.getInt("id"));
				resource.setFileName(rs.getString("fileName"));
				resource.setUn(rs.getString("un"));
				resource.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resource;
	}
	
	/**
	 * 通过上传文件的用户查找
	 * @param un
	 * @return
	 */
	public List<Resources> querySource(String un){
		Connection conn = ConnectionGS.getConnection();
		List<Resources> list_resource = new ArrayList<Resources>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from mysql_source where un='" + un + "' UNION ALL " +
					"select * from sqlserver_source where un='" + un + "' UNION ALL " +
					"select * from oracle_source where un='" + un + "' order by time desc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Resources resource = new Resources();

				resource.setFileName(rs.getString("fileName"));
				resource.setUn(rs.getString("un"));
				resource.setTime(rs.getDate("time"));
				
				list_resource.add(resource);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_resource;
	}
	
	/**
	 * @param value1 
	 * @param value2 
	 * @param value3 
	 * @return
	 */
	public List<Resources> queryCourse(){
		Connection conn = ConnectionGS.getConnection();
		List<Resources> list_resource = new ArrayList<Resources>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from mysql_course UNION ALL " +
					"select * from sqlserver_course UNION ALL " +
					"select * from oracle_course order by time desc";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Resources resource = new Resources();

				resource.setFileName(rs.getString("fileName"));
				resource.setUn(rs.getString("un"));
				resource.setTime(rs.getDate("time"));
				
				list_resource.add(resource);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_resource;
	}
	
	/**
	 * 
	 * @param resource 需要更新到数据表的数据
	 * @param id 用来判断哪行
	 * @param kind 用来判断数据表
	 * @return
	 */
	public int update(Resources resource,int id,String kind){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		String sql = "update " + kind + " set fileName=?,un=?,time=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, resource.getFileName());
			ps.setString(2, resource.getUn());
			ps.setDate(3, resource.getTime());
			ps.setInt(4, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}