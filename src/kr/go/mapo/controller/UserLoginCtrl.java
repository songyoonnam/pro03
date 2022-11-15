package kr.go.mapo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kr.go.mapo.model.UserDAO;

@WebServlet({"/UserLoginCtrl.do"})
public class UserLoginCtrl extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String msg = "";
    UserDAO dao = new UserDAO();
    int cnt = dao.userLogin(id, pw);
    HttpSession session = request.getSession();
    if (cnt == 1) {
      msg = "";
      session.setAttribute("sid", id);
      response.sendRedirect(request.getContextPath());
    } else if (cnt == 9) {
      msg = "";
      response.sendRedirect("./user/login.jsp?msg=" + msg);
    } else {
      msg = "";
      response.sendRedirect("./user/login.jsp?msg=" + msg);
    } 
  }
}
