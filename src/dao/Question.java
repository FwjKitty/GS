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
	
	public int add(Questions question){
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
		}
		return result;
	}
	
	public int delete(int id){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			Statement cs = conn.createStatement();
			result = cs.executeUpdate("delete from question where id='" + id + "'");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Questions> query(){
		Connection conn = ConnectionGS.getConnection();
		List<Questions> list_question = new ArrayList<Questions>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from question");
			
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
		}
		return list_question;
	}
	
	public Questions query(int id){
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
		}
		return question;
	}
	
	public List<Questions> query(String un){
		Connection conn = ConnectionGS.getConnection();
		List<Questions> list_question = new ArrayList<Questions>();
		try {
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery("select * from question where un='" + un + "' order by id asc");
			
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
		}
		return list_question;
	}
	
	public int update(Questions question,int id){
		int result = 0;
		Connection conn = ConnectionGS.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement("update question set question=?,answer=?,un=?,admin=?,time=? where id=?");
			
			ps.setString(1, question.getQuestion());
			ps.setString(2, question.getAnswer());
			ps.setString(3, question.getUn());
			ps.setString(4, question.getAdmin());
			ps.setDate(5, question.getTime());
			ps.setInt(6, id);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}