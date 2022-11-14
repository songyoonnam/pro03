package kr.go.mapo.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.mapo.dto.NoticeDTO;
import kr.go.mapo.model.NoticeDAO;

@WebServlet("/GetNoticeListCtrl.do")
public class GetNoticeListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//dao
		NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeDTO> notiList = dao.getNoticeList();
		
		//daoview
		request.setAttribute("list", notiList);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/notice/noticeList.jsp");
		view.forward(request, response);
	}
}