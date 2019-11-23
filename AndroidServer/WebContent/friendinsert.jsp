<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
   
   //파라미터 읽기
   request.setCharacterEncoding("utf-8");
   
   String id =  request.getParameter("id");
   String friendidlist = request.getParameter("friend");
   String [] ar = friendidlist.split(",");
  
   int rs = -1;
   for(String friend : ar){
   //SQL 생성 
   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
		   "insert into friend(memberid, friendid) values(?,?)");
   
   pstmt.setString(1,id);
   pstmt.setString(2, friend);
   rs = pstmt.executeUpdate();
   }
   
   
   if(rs > 0){
	   out.println("success");
   }else{
	   out.println("fail");
   }
   %>
