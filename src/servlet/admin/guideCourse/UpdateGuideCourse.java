package servlet.admin.guideCourse;

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

import dao.GuideCourse;

import beans.GuideCourses;

@SuppressWarnings({ "serial"})
public class UpdateGuideCourse extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String image = null;
		GuideCourses guideCourse = new GuideCourses();
		//设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/file/guideCourse");
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
					String filename = "";
					filename = fi.getName();
					//如果用户没有在FORM表单的文件字段中选择任何文件， 那么忽略对该字段项的处理
					if (filename.equals("")) {
						continue;
					}
					// 对上传的图片进行重新命名
					String fileExt = filename.substring(filename.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
					String middlename = sdf.format(new Date(System.currentTimeMillis()));
					String lastname = Math.round(Math.random() * 1000) + "";
					String localFileName = middlename + lastname + "." + fileExt;
					fi.write(new File(uploadDir, localFileName));
					image = "file\\guideCourse\\"+localFileName;
				}catch (Exception e) {
					out.println("<script language='javascript'>alert('存储文件时出现错误！');history.go(-1);</script>");
					return;
				}finally
				{
					fi.delete();
				}
			}
		}
		if(image == null){
			guideCourse.setImage((String) request.getAttribute("image"));
		}else{
			guideCourse.setImage(image);
			String path = (String) request.getAttribute("image");
			String path1 = getServletContext().getRealPath(path);
			File file = new File(path1);
			if (file.exists()) {
				file.delete();
				System.out.println("删除资源文件完成！ ");
			} else {
				System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
			}
		}
		guideCourse.setId(Integer.parseInt((String)request.getAttribute("id")));
		guideCourse.setName((String)request.getAttribute("name"));
		guideCourse.setTitle((String)request.getAttribute("title"));
		guideCourse.setIntroduce((String)request.getAttribute("introduce"));
		
		int result = GuideCourse.update(guideCourse);
		if(result > 0){
			response.sendRedirect("FindAllGuideCourse?page=1");
		}else{
			out.print("<script>alert('修改 "+guideCourse.getName()+" 失败，请重新修改！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}