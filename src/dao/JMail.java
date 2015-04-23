package dao;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.Session;

import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;

public class JMail {
	public void mail(String ip, int port, String un, String pw){
		/*
		 * 把配置文件内容加载到prop中
		 */
		Properties pro = new Properties();
		try {
			pro.load(this.getClass().getClassLoader().getResourceAsStream("mail.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		/*
		 * 登陆邮件服务器，得到session 
		 */
		String host = pro.getProperty("host");
		String username = pro.getProperty("username");
		String password = pro.getProperty("password");
		Session session = MailUtils.createSession(host, username, password);
		/*
		 * 创建mail对象
		 */
		String from = pro.getProperty("from");
		String to = un;
		String subject = pro.getProperty("subject");
		//MessageFormat.format方法会把第一个参数中的"{0}"(即占位符),使用第二个参数来代替
		//例如MessageFormat.format("你好{0},你{1}!","asd1","asd11");
		//后面四个参数分别代表ip、端口port、注册的用户名和密码
		String content = MessageFormat.format(pro.getProperty("content"),ip,String.valueOf(port),un,pw);
		Mail mail = new Mail(from, to, subject, content);
		/*
		 * 发送邮件
		 */
		try {
			MailUtils.send(session, mail);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}