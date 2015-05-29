package beans;

import java.sql.Date;

public class Sources {
	
	private int id;
	private String title;
	private String fileName;
	private String un;
	private Date time;
	private int course_id;
	//用户删除资源时用来识别
	private String kind;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUn() {
		return un;
	}
	public void setUn(String un) {
		this.un = un;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int courseId) {
		course_id = courseId;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
}