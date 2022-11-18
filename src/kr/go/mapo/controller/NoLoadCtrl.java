package kr.go.mapo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.go.mapo.model.TourDAO;
import org.json.JSONObject;

@WebServlet({"/NoLoadCtrl.do"})
public class NoLoadCtrl extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int i = 0;
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    TourDAO dao = new TourDAO();
    int firstNo = dao.loadLastNo();
    String no = "";
    if (firstNo <= 9) {
      no = "000" + firstNo;
    } else if (firstNo <= 99) {
      no = "00" + firstNo;
    } else if (firstNo <= 999) {
      no = "0" + firstNo;
    } else {
      i = firstNo;
    } 
    JSONObject json = new JSONObject();
    json.put("no", i);
    PrintWriter out = response.getWriter();
    out.println(json.toString());
  }
}
