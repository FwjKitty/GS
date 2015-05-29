package servlet.admin.source;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import dao.Source;

import beans.Sources;

@SuppressWarnings({ "serial", "deprecation" })
public class AddSource extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request, response);
	}
	
	@SuppressWarnings({"unchecked" })
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Sources source = new Sources();
		
		String title = "";
		String filename = null;
		//设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/file/source");
		if (uploadDir == null) {
			out.println("无法访问存储目录！");
			return;
		}
		File fUploadDir = new File(uploadDir);
		if (!fUploadDir.exists()) {
			if (!fUploadDir.mkdir()) {
				out.println("无法创建存储目录!");
				return;
			}
		}

		if (!DiskFileUpload.isMultipartContent(request)) {
			out.println("只能处理multipart/form-data类型的数据!");
			return;
		}

		DiskFileUpload fu = new DiskFileUpload();

		//设置上传的普通字段的名称和文件字段的文件名所采用的字符集编码
		fu.setHeaderEncoding("UTF-8");

		//得到所有表单字段对象的集合
		List fileItems = null;
		try {
			fileItems = fu.parseRequest(request);
		} catch (FileUploadException e) {
			out.println("<script language='javascript'>alert('解析数据时出现错误！');history.go(-1);</script>");
			return;
		}

		//处理每个表单字段
		Iterator i = fileItems.iterator();
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()) {
				String content1 = fi.getString("UTF-8");
				String fieldName = fi.getFieldName();
				request.setAttribute(fieldName, content1);
			} else {
				try {
					title = fi.getName();
					/*如果用户没有在FORM表单的文件字段中选择任何文件，那么忽略对该字段项的处理*/
					if (title.equals("")) {
						continue;
					}
					
					String fileExt = title.substring(title.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
					String middlename = sdf.format(new Date(System.currentTimeMillis()));
					String lastname = Math.round(Math.random() * 1000) + "";
					String localFileName = middlename + lastname + "." + fileExt;
					fi.write(new File(uploadDir, localFileName));
					filename = localFileName;
//					String fieldName = fi.getFieldName();
//					request.setAttribute(fieldName, fileName);
				}catch (Exception e) {
					out.println("<script language='javascript'>alert('存储文件时出现错误！');history.go(-1);</script>");
					return;
				}finally
				{
					fi.delete();
				}
			}
		}
		filename = "file\\source\\"+filename;
		String kind = (String)request.getAttribute("kind");
		source.setTitle(title);
		source.setFileName(filename);
		source.setUn((String) request.getSession().getAttribute("un"));
		source.setCourse_id(Integer.parseInt((String)request.getAttribute("course_id")));
		source.setTime(new Date(System.currentTimeMillis()));
		int result = Source.add(source,kind);
		if (result > 0) {
			request.getRequestDispatcher("FindAllSource?page=1&kind="+kind).forward(request, response);
		} else {
			out.println("<script language='javascript'>alert('添加失败，请重新添加！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}