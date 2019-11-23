<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
   //MySQL 드라이버 로드
   Class.forName("com.mysql.jdbc.Driver");
   //데이터베이스 접속 객체 생성
   
   request.setCharacterEncoding("utf-8");
   //입력한 내용을 가져오기 
   String text = request.getParameter("text");
   String id = request.getParameter("id");
    
   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
		   "insert into article(id, regdate, content, good, dislike) values(?, curdate(), ?, 0, 0)");
   //물음표 자리에 입력한 값을 삽입하기 
   pstmt.setString(1, id);
   pstmt.setString(2, text);
  
   int r = pstmt.executeUpdate();
   
   pstmt.close();
  
   
   if(r > 0){
	   out.println("success");
   }else{
	   out.println("fail");
   }
%>