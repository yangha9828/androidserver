<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*" %>
<%
   //MySQL 드라이버 로드
   Class.forName("com.mysql.jdbc.Driver");
   //데이터베이스 접속 객체 생성
  
   
   //파라미터 읽기
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   String name = request.getParameter("name");
   String gender = request.getParameter("gender");
   String birth = request.getParameter("birth");
   
   String mail = request.getParameter("mail");
   String mobile = request.getParameter("mobile");
   
   //SQL 생성 
   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
		   "insert into member(id, password, name, gender, birth, mail, phone ) values(?,?,?,?,?,?,?)");
   pstmt.setString(1, id);
   pstmt.setString(2, org.mindrot.jbcrypt.BCrypt.hashpw(password, org.mindrot.jbcrypt.BCrypt.gensalt(10)));
   pstmt.setString(3, name);
   pstmt.setString(4, gender);
   pstmt.setString(5, birth);
   pstmt.setString(6, mail);
   pstmt.setString(7, mobile);
   int rs = pstmt.executeUpdate();
   if(rs > 0){
	   out.println("success");
   }else{
	   out.println("fail");
   }
   %>
