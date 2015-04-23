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
import beans.Descriptions;

public class Description {
	
	public static List<Descriptions> queryAll(){
		Connection conn = ConnectionGS.getConnection();
		List<Descriptions> list_description = new ArrayList<Descriptions>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from description");
			
			while(rs.next()){
				Descriptions description = new Descriptions();
				description.setId(rs.getInt("id"));
				description.setName(rs.getString("name"));
				description.setInfo(rs.getString("info"));
				description.setImage(rs.getString("image"));
				description.setIntroduce(rs.getString("introduce"));
				list_description.add(description);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_description;
	}
	
	public static List<Descriptions> getPageResult(int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		int totalPage = pageSize * (page - 1);
		List<Descriptions> list_description = new ArrayList<Descriptions>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from description order by id desc limit "+totalPage+","+pageSize);
			
			while(rs.next()){
				Descriptions description = new Descriptions();
				description.setId(rs.getInt("id"));
				description.setName(rs.getString("name"));
				description.setInfo(rs.getString("info"));
				description.setImage(rs.getString("image"));
				description.setIntroduce(rs.getString("introduce"));
				list_description.add(description);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_description;
	}
	
	public static int getCount() {
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from description");
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
	
	public static int addDescription(Descriptions description){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "insert into description(id, name, info, image, introduce) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, description.getId());
			ps.setString(2, description.getName());
			ps.setString(3, description.getInfo());
			ps.setString(4, description.getImage());
			ps.setString(5, description.getIntroduce());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static int update(Descriptions description){
		Connection conn = ConnectionGS.getConnection();
		int result = 0;
		String sql = "update description set name=?, info=?, image=?, introduce=? where id=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, description.getName());
			ps.setString(2, description.getInfo());
			ps.setString(3, description.getImage());
			ps.setString(4, description.getIntroduce());
			ps.setInt(5, description.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static Descriptions queryById(int id){
		Descriptions description = new Descriptions();
		Connection conn = ConnectionGS.getConnection();
		String sql = "select * from description where id="+id;
		
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery(sql);
			while(rs.next()){
				description.setId(rs.getInt("id"));
				description.setName(rs.getString("name"));
				description.setInfo(rs.getString("info"));
				description.setImage(rs.getString("image"));
				description.setIntroduce(rs.getString("introduce"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			ConnectionGS.close();
		}
		return description;
	}
	
	public static int del(int id){
		Connection conn = ConnectionGS.getConnection();
		String sql = "delete from description where id="+id;
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
	
	public static void delFile(String image, String introduce){
		File fimage = new File(image);
		File fintroduce = new File(introduce);
		if(fimage.exists()){
			fimage.delete();
			System.out.println("删除资源文件完成！ ");
		}else{
			System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
		}
		if(fintroduce.exists()){
			fintroduce.delete();
			System.out.println("删除资源文件完成！ ");
		}else{
			System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
		}
	}
}