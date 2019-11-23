<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
    
    <%
    
    	String num = request.getParameter("num");
    	System.out.println("num:" + num);
    	//데이터베이스 접속 객체 생성
    	   
    	   
    	   
    	   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
    			   "delete from comment where num=?");
    	   //물음표 자리에 입력한 값을 삽입하기 
    	   pstmt.setString(1, num);
    	   
    	  
    	   int r = pstmt.executeUpdate();
    	   System.out.println("num:" + r);
    	   pstmt.close();
    	   
    	   
    	   out.println("success");
    %>