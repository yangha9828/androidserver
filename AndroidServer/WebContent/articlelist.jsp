 <%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*, org.json.simple.*" %>

<%
   //MySQL 드라이버 로드
   Class.forName("com.mysql.jdbc.Driver");
   //데이터베이스 접속 객체 생성
   
   //입력한 데이터 가져오기 
   request.setCharacterEncoding("utf-8");
   JSONArray list = new JSONArray();
   
   String id = request.getParameter("id");
   //SQL 만들기
   PreparedStatement pstmt = vo.Dao.con.prepareStatement("select * from article where id=?");
   pstmt.setString(1, id);
   ResultSet rs = pstmt.executeQuery();
   while(rs.next()){
	   	JSONObject obj = new JSONObject();
	   	obj.put("num", rs.getInt("num"));
	   	obj.put("id", rs.getString("id"));
	   	obj.put("content", rs.getString("content"));
	   	obj.put("regdate", rs.getString("regdate"));
	   	obj.put("good", rs.getString("good"));
	   	obj.put("dislike", rs.getString("dislike"));  	
	   	list.add(obj);
  }
  pstmt.close();
  rs.close();
  
  pstmt = vo.Dao.con.prepareStatement("select * from friend where memberid=?");
  pstmt.setString(1, id);
  rs = pstmt.executeQuery();
  while(rs.next()){
	   String friendid = rs.getString("friendid");
	   PreparedStatement pstmt1 = vo.Dao.con.prepareStatement("select * from article where id=?");
	   pstmt1.setString(1, friendid);
	   ResultSet rs1 = pstmt1.executeQuery();
	   while(rs1.next()){
		 	JSONObject obj = new JSONObject();
		   	obj.put("num", rs1.getInt("num"));
		   	obj.put("id", rs1.getString("id"));
		   	obj.put("content", rs1.getString("content"));
		   	obj.put("regdate", rs1.getString("regdate"));
		   	obj.put("good", rs1.getString("good"));
		   	obj.put("dislike", rs1.getString("dislike"));	
		   	list.add(obj);
	  }
	   rs1.close();
	   pstmt1.close();
  }
   
   //정리 
   rs.close();
   pstmt.close();
   
   response.setContentType("application/json");
   out.print(list.toJSONString()); // json 형식으로 출력
%>

