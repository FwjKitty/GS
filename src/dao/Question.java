package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionGS;
import beans.Questions;

public class Question {
	
	public static int add(Questions question){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("insert into question(question,answer,un,admin,time) values(?,?,?,?,?)");
			
			ps.setString(1, question.getQuestion());
			ps.setString(2, question.getAnswer());
			ps.setString(3, question.getUn());
			ps.setString(4, question.getAdmin());
			ps.setDate(5, question.getTime());
			
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
			result = cs.executeUpdate("delete from question where id='" + id + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
	
	public static List<Questions> getPageResult(int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		int totalPage = pageSize * (page - 1);
		List<Questions> list_question = new ArrayList<Questions>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from question order by id asc limit "+totalPage+","+pageSize);
			
			while(rs.next()){
				Questions question = new Questions();
				question.setId(rs.getInt("id"));
				question.setQuestion(rs.getString("question"));
				question.setAnswer(rs.getString("answer"));
				question.setUn(rs.getString("un"));
				question.setAdmin(rs.getString("admin"));
				question.setTime(rs.getDate("time"));
				
				list_question.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_question;
	}
	
	public static int getCount() {
		Connection conn = ConnectionGS.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from question");
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
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement("select count(*) from question where un="+un);
			ResultSet rs = pstmt.executeQuery();
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
	
	public static Questions queryById(int id){
		Questions question = new Questions();
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from question where id='" + id + "'");
			
			while(rs.next()){
				question.setId(rs.getInt("id"));
				question.setQuestion(rs.getString("question"));
				question.setAnswer(rs.getString("answer"));
				question.setUn(rs.getString("un"));
				question.setAdmin(rs.getString("admin"));
				question.setTime(rs.getDate("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return question;
	}
	
	public static List<Questions> queryByUn(String un, int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		List<Questions> list_question = new ArrayList<Questions>();
		int totalPage = pageSize * (page - 1);
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from question where un='" + un + "' order by id asc limit "+totalPage+", "+pageSize);
			
			while(rs.next()){
				Questions question = new Questions();
				question.setId(rs.getInt("id"));
				question.setQuestion(rs.getString("question"));
				question.setAnswer(rs.getString("answer"));
				question.setUn(rs.getString("un"));
				question.setAdmin(rs.getString("admin"));
				question.setTime(rs.getDate("time"));
				
				list_question.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_question;
	}
	
	public static List<Questions> queryByQuestion(String question, int page, int pageSize){
		Connection conn = ConnectionGS.getConnection();
		List<Questions> list_question = new ArrayList<Questions>();
		int totalPage = pageSize * (page - 1);
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from question where question like '%" + question + "%' order by id asc limit "+totalPage+", "+pageSize);
			while(rs.next()){
				Questions question1 = new Questions();
				question1.setId(rs.getInt("id"));
				question1.setQuestion(rs.getString("question"));
				question1.setUn(rs.getString("un"));
				question1.setTime(rs.getDate("time"));
				
				list_question.add(question1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return list_question;
	}
	
	public static int update(Questions question){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("update question set question=?,answer=?,un=?,admin=?,time=? where id=?");
			
			ps.setString(1, question.getQuestion());
			ps.setString(2, question.getAnswer());
			ps.setString(3, question.getUn());
			ps.setString(4, question.getAdmin());
			ps.setDate(5, question.getTime());
			ps.setInt(6, question.getId());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionGS.close();
		}
		return result;
	}
}