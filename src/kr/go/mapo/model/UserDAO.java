package kr.go.mapo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.go.mapo.dto.UserDTO;
import kr.go.mapo.model.Maria;
import kr.go.mapo.model.UserDAO;
import kr.go.mapo.service.AES256;

public class UserDAO {
  private Connection con = null;
  
  private PreparedStatement pstmt = null;
  
  private ResultSet rs = null;
  
  String key = "%02x";
  
  public int idCheckPro(String id) {
    int cnt = 0;
    try {
      this.con = Maria.getConnection();
      this.pstmt = this.con.prepareStatement("select * from user where id=?");
      this.pstmt.setString(1, id);
      this.rs = this.pstmt.executeQuery();
      if (this.rs.next()) {
        cnt++;
      } else {
        cnt = 0;
      } 
    } catch (ClassNotFoundException e) {
      System.out.println("");
    } catch (Exception e) {
      System.out.println("SQL ");
    } finally {
      Maria.close(this.rs, this.pstmt, this.con);
    } 
    return cnt;
  }
  
  public int addUser(UserDTO user) {
    int cnt = 0;
    try {
      this.con = Maria.getConnection();
      this.pstmt = this.con.prepareStatement("insert into user(id, pw, name, birth, email, tel, addr) values (?,?,?,?,?,?,?)");
      this.pstmt.setString(1, user.getId());
      this.pstmt.setString(2, user.getPw());
      this.pstmt.setString(3, user.getName());
      this.pstmt.setString(4, user.getBirth());
      this.pstmt.setString(5, user.getEmail());
      this.pstmt.setString(6, user.getTel());
      this.pstmt.setString(7, user.getAddr());
      cnt = this.pstmt.executeUpdate();
    } catch (ClassNotFoundException e) {
      System.out.println("");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("SQL" );
      e.printStackTrace();
    } catch (Exception e) {
      System.out.println("");
    } finally {
      Maria.close(this.pstmt, this.con);
    } 
    return cnt;
  }
  
  public int userLogin(String id, String pw) {
    int cnt = 0;
    String qpw = "";
    try {
      this.con = Maria.getConnection();
      this.pstmt = this.con.prepareStatement("update user set visted=visted+1 where id=?");
      this.pstmt.setString(1, id);
      this.pstmt.executeUpdate();
      this.pstmt.close();
      this.pstmt = this.con.prepareStatement("select * from user where id=?");
      this.pstmt.setString(1, id);
      this.rs = this.pstmt.executeQuery();
      if (this.rs.next()) {
        qpw = AES256.decryptAES256(this.rs.getString("pw"), this.key);
        System.out.println(": " + qpw);
        if (pw.equals(qpw)) {
          cnt = 1;
        } else {
          cnt = 0;
        } 
      } else {
        cnt = 9;
      } 
    } catch (ClassNotFoundException e) {
      System.out.println("");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("SQL ");
      e.printStackTrace();
    } catch (Exception e) {
      System.out.println("");
    } finally {
      Maria.close(this.pstmt, this.con);
    } 
    return cnt;
  }
  
  public UserDTO userInfo(String id) {
    UserDTO dto = new UserDTO();
    try {
      this.con = Maria.getConnection();
      this.pstmt = this.con.prepareStatement("select * from user where id=?");
      this.pstmt.setString(1, id);
      this.rs = this.pstmt.executeQuery();
      if (this.rs.next()) {
        dto.setId(this.rs.getString("id"));
        dto.setPw(AES256.decryptAES256(this.rs.getString("pw"), this.key));
        dto.setName(this.rs.getString("name"));
        dto.setEmail(this.rs.getString("email"));
        dto.setTel(this.rs.getString("tel"));
        dto.setGrade(this.rs.getString("grade"));
        dto.setAddr(this.rs.getString("addr"));
        dto.setPoint(this.rs.getInt("point"));
        dto.setVisted(this.rs.getInt("visted"));
        dto.setBirth(this.rs.getString("birth"));
        dto.setRegdate(this.rs.getString("regdate"));
      } 
    } catch (ClassNotFoundException e) {
      System.out.println("");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("SQL" );
      e.printStackTrace();
    } catch (Exception e) {
      System.out.println("");
    } finally {
      Maria.close(this.rs, this.pstmt, this.con);
    } 
    return dto;
  }
  
  public int updateUser(UserDTO user) {
    int cnt = 0;
    try {
      this.con = Maria.getConnection();
      this.pstmt = this.con.prepareStatement("update user set pw=?, name=?, birth=?, email=?, tel=?, addr=? where id=?");
      this.pstmt.setString(1, user.getPw());
      this.pstmt.setString(2, user.getName());
      this.pstmt.setString(3, user.getBirth());
      this.pstmt.setString(4, user.getEmail());
      this.pstmt.setString(5, user.getTel());
      this.pstmt.setString(6, user.getAddr());
      this.pstmt.setString(7, user.getId());
      cnt = this.pstmt.executeUpdate();
    } catch (ClassNotFoundException e) {
      System.out.println("");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("SQL" );
      e.printStackTrace();
    } catch (Exception e) {
      System.out.println("");
    } finally {
      Maria.close(this.pstmt, this.con);
    } 
    return cnt;
  }
  
  public ArrayList<UserDTO> getUserList() {
    ArrayList<UserDTO> userList = new ArrayList<>();
    try {
      this.con = Maria.getConnection();
      this.pstmt = this.con.prepareStatement("select * from user");
      this.rs = this.pstmt.executeQuery();
      while (this.rs.next()) {
        UserDTO dto = new UserDTO();
        dto.setId(this.rs.getString("id"));
        dto.setPw(AES256.decryptAES256(this.rs.getString("pw"), this.key));
        dto.setName(this.rs.getString("name"));
        dto.setEmail(this.rs.getString("email"));
        dto.setTel(this.rs.getString("tel"));
        dto.setGrade(this.rs.getString("grade"));
        dto.setAddr(this.rs.getString("addr"));
        dto.setPoint(this.rs.getInt("point"));
        dto.setVisted(this.rs.getInt("visted"));
        dto.setBirth(this.rs.getString("birth"));
        dto.setRegdate(this.rs.getString("regdate"));
        System.out.println(dto.getId());
        userList.add(dto);
      } 
    } catch (ClassNotFoundException e) {
      System.out.println("");
      e.printStackTrace();
    } catch (SQLException e) {
      System.out.println("SQL ");
      e.printStackTrace();
    } catch (Exception e) {
      System.out.println("");
    } finally {
      Maria.close(this.rs, this.pstmt, this.con);
    } 
    return userList;
  }
}
