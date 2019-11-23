<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>


<%
   //MySQL 드라이버 로드
   Class.forName("com.mysql.jdbc.Driver");
   //데이터베이스 접속 객체 생성
  
   //입력한 데이터 가져오기 
   request.setCharacterEncoding("utf-8");
   
   String num = request.getParameter("num");
   //SQL 만들기
   PreparedStatement pstmt = vo.Dao.con.prepareStatement("update article set good = good  + 1 where num = ?");
   pstmt.setString(1, num);
   pstmt.executeUpdate();
     
	pstmt.close();
   
  
      
%>
