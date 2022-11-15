package kr.go.mapo.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.go.mapo.dto.PicDTO;
import kr.go.mapo.model.TourDAO;


@WebServlet("/ImgUploadCtrl.do")
public class ImgUploadCtrl<picDTO> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pos = Integer.parseInt(request.getParameter("pos"));
		String tourno = "";
		String file1 = "", fileName1="", file2="", fileName2="";
		String pat = "./upload/";
		String realPat = "D:\\nsy\\pro01\\pro03\\Webcontent\\upload";
		String saveDir = "upload";
		String saveFolder = "D:/nsy/pro01/pro03/src";
		String encType = "UTF-8";
		String realPath = "";
		String uploadPath = "";
		int maxSize = 10*1024*1024;
		String pdata = request.getParameter("picname");
		TourDAO dao = new TourDAO();
		PicDTO dto = new PicDTO();
		
		try {
			ServletContext context = request.getServletContext();
			realPath = context.getRealPath(saveDir);
			uploadPath = request.getRealPath(saveDir);
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realPath, maxSize, encType);
			
			pos = Integer.parseInt(multi.getParameter("pos"));
			file1 = multi.getParameter("picname");
			fileName1 = multi.getParameter("picname");
			//file2.getFilesystemName(file2);
			fileName2 =multi.getFilesystemName(fileName2);
			dto.setPicname(file2);
			dto.setPos(pos);
			dto.setTourno(tourno);
			dao.fileUpload(dto);
			
			int cnt = dao.fileUpload(dto);
			if(cnt>=1){
				System.out.println("업로드 성공");
			} else {
				System.out.println("업로드 실패");
			}
				
			} catch (Exception e){
				
			}
		}
		
	}
