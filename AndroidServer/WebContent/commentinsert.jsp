<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*" %>
<%
   //MySQL 드라이버 로드
   Class.forName("com.mysql.jdbc.Driver");
   //데이터베이스 접속 객체 생성
   
   
   //파라미터 읽기
   request.setCharacterEncoding("utf-8");
   
   String artnum = request.getParameter("artnum");
   String comment = request.getParameter("comment"); 
   String id =  request.getParameter("id");
   
   //SQL 생성 
   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
		   "insert into comment(artnum, comment, id, regdate, good, dislike) values(?,?,?,curdate(),0,0)");
   
   pstmt.setInt(1, Integer.parseInt(artnum));
   pstmt.setString(2, comment);
   pstmt.setString(3, id);
   
   
   
   int rs = pstmt.executeUpdate();
   if(rs > 0){
	   out.println("success");
   }else{
	   out.println("fail");
   }
   %>
