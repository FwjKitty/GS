package beans;

import java.sql.Date;

public class Sources {
	
	private int id;
	private String fileName;
	private String un;
	private Date time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
}