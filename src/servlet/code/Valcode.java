package servlet.code;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Valcode extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 告知浏览当作图片处理
		response.setContentType("image/jpeg");
		// 告诉浏览器不缓存
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setHeader("expires", "0");
		// 产生由4位数字构成的验证码
		int length = 4;
		String valcode = "";
		
		char[] seq = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
				'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y',
				'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b',
				'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 'u', 'v', 'w', 'y', 'z'};
		
		Random rd = new Random();
		for(int i=0; i<length; i++){
			valcode+=seq[rd.nextInt(seq.length)];
		}
		//把产生的验证码存入到Session中
		HttpSession session = request.getSession();
		session.setAttribute("valcode", valcode);
		//产生图片
		int width = 80;
		int height = 25;
		BufferedImage img = new BufferedImage(width,  height,BufferedImage.TYPE_INT_RGB);
		//获取一个Graphics
		Graphics g = img.getGraphics();
		//填充背景色
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		//填充干扰线50
		for(int i=0; i<50; i++){
			g.setColor(new  Color(rd.nextInt(100)+155,rd.nextInt(100)+155,rd.nextInt(100)+155));
			g.drawLine(rd.nextInt(width),  rd.nextInt(height),rd.nextInt(width), rd.nextInt(height));
		}
		//绘制边框
		g.setColor(Color.GRAY);
		g.drawRect(0, 0, width-1, height-1);
		//绘制验证码
		Font[] fonts = {new Font("隶书",Font.BOLD,18),new Font("楷体 ",Font.BOLD,18),new Font("宋体",Font.BOLD,18),new Font("幼圆",Font.BOLD,18)};
		for(int i=0; i<length; i++){  
			g.setColor(new  Color(rd.nextInt(150),rd.nextInt(150),rd.nextInt(150)));
			g.setFont(fonts[rd.nextInt(fonts.length)]);
			g.drawString(valcode.charAt(i)+"",  width/valcode.length()*i+2, 18);
		}
		//输出图像
		g.dispose();
		ImageIO.write(img, "jpeg", response.getOutputStream()); 
	}
}