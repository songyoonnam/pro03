package kr.go.mapo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.mapo.dto.PicDTO;
import kr.go.mapo.model.TourDAO;
import net.sf.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;


@WebServlet("/ImgUploadCtrl.do")
public class ImgUploadCtrl<picDTO> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int maxSize = 10*1024*1024;
		String saveFolder = "D:/nsy/pro01/pro03/webapps/upload"; //개발자 디렉토리
		String uploadPath = request.getRealPath("/upload"); //서버 디렉토리
		
		TourDAO dao = new TourDAO(); 
		PicDTO dto = new PicDTO();
		
		try {
			//서버 디렉토리에 먼저 파일을 업로드
			//MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8");
			
			int pos = Integer.parseInt(multi.getParameter("pos"));
			String tourno = multi.getParameter("tourno");
				
			Enumeration files=multi.getFileNames();
		
			String file1 =(String) files.nextElement();
			String fileName1=multi.getFilesystemName(file1);
			
			String imageURL = uploadPath + fileName1;
			
			
			System.out.println(file1);
			
			dto.setPicname(fileName1);
			dto.setPos(pos);
			dto.setTourno(tourno);
			
			int cnt = dao.fileUpload(dto);
			if(cnt>=1){
				System.out.println("업로드 성공");
			} else {
				System.out.println("업로드 실패");
				response.sendRedirect("./tour/imgUpload.jsp?no="+pos+"&tourno="+tourno);
			}

			PrintWriter out = response.getWriter();
			TourDAO tour = new TourDAO();
			ArrayList<PicDTO> picList = tour.JSONPicList(tourno);
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("picList", picList);
			
			JSONObject json = new JSONObject();
			json.putAll(map);
			out.println(json);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}