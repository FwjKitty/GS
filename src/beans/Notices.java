package beans;

import java.sql.Date;


public class Notices {
	
	private int id;
	private String title;
	private String content;
	private String un;
	private Date time;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}