<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>


<%
   //MySQL 드라이버 로드
   Class.forName("com.mysql.jdbc.Driver");
   //데이터베이스 접속 객체 생성
  
   //입력한 데이터 가져오기 
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   //SQL 만들기
   PreparedStatement pstmt = vo.Dao.con.prepareStatement("select * from member where id = ?");
   pstmt.setString(1, id);
   //SQL 실행 
   ResultSet rs = pstmt.executeQuery();
   if(rs.next()){
	   String password = rs.getString("password");
	   
	   boolean r = org.mindrot.jbcrypt.BCrypt.checkpw(pw, password);
	   if(r == true){
		out.print(rs.getString("name"));
	   }
	   else{
		   out.print("fail");
	   }

   }else{
	  out.print("fail");
   }
   
   //정리 
   rs.close();
   pstmt.close();
   
%>