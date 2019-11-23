<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
    
    <%
    
    	String memberid = request.getParameter("memberid");
		String friendid = request.getParameter("friendid");

		String [] ar = friendid.split(",");
    	//데이터베이스 접속 객체 생성
    	   
    	   for(String fid : ar){
    	   
    	   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
    			   "delete from friend where memberid=? and friendid=?");
    	   //물음표 자리에 입력한 값을 삽입하기 
    	   pstmt.setString(1, memberid);
    	   pstmt.setString(2, fid);
    	   
    	  
    	   int r = pstmt.executeUpdate();
    	   pstmt.close();
    	   }
    	   
    	   out.println("success");
    %>