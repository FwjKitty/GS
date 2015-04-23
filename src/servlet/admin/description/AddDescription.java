package servlet.admin.description;

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

import dao.Description;

import beans.Descriptions;


@SuppressWarnings("serial")
public class AddDescription extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Descriptions description = new Descriptions();
		String image = "";
		String introduce = "";
		//设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/file/description");
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
		//最多上传200M数据
		fu.setSizeMax(1024 * 1024 * 200);
		//超过1M的字段数据采用临时文件缓存
		fu.setSizeThreshold(1024 * 1024);

		//设置上传的普通字段的名称和文件字段的文件名所采用的字符集编码
		fu.setHeaderEncoding("UTF-8");

		//得到所有表单字段对象的集合
		List fileItems = null;
		try {
			fileItems = fu.parseRequest(request);
		} catch (FileUploadException e) {
			out.println("<script language='javascript'>alert('解析数据时出现错误！');history.go(-1);';</script>");
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
					String fileName = "";
					fileName = fi.getName();
					/*如果用户没有在FORM表单的文件字段中选择任何文件，那么忽略对该字段项的处理*/
					if (fileName.equals("")) {
						continue;
					}
					
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
					String middlename = sdf.format(new Date(System.currentTimeMillis()));
					String lastname = Math.round(Math.random() * 1000) + "";
					String localFileName = middlename + lastname + "."+ fileExt;
					fi.write(new File(uploadDir, localFileName));
					if(fi.getFieldName().equals("image")){
						image = "file\\description\\"+localFileName;
					}else if(fi.getFieldName().equals("introduce")){
						introduce = "file\\description\\"+localFileName;
					}
				} catch (Exception e) {
					out.println("<script language='javascript'>alert('存储文件时出现错误！');history.go(-1);</script>");
					return;
				} finally
				{
					fi.delete();
				}
			}
		}
		
		description.setName((String) request.getAttribute("name"));
		description.setInfo((String) request.getAttribute("info"));
		description.setImage(image);
		description.setIntroduce(introduce);
		
		int result = Description.addDescription(description);
		
		if(result > 0){
			response.sendRedirect("FindAllDescription?page=1");
		}else{
			out.print("<script>alert('添加失败，请重新添加！');</script>");
		}
		out.flush();
		out.close();
	}
}