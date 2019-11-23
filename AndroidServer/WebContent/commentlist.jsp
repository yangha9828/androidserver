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
   
   String artnum = request.getParameter("artnum");
   //SQL 만들기
   PreparedStatement pstmt = vo.Dao.con.prepareStatement("select * from comment where artnum=? order by num desc");
   pstmt.setInt(1,Integer.parseInt(artnum));
   ResultSet rs = pstmt.executeQuery();
   while(rs.next()){
	   	JSONObject obj = new JSONObject();
	   	obj.put("num", rs.getInt("num"));
	   	obj.put("artnum", rs.getInt("artnum"));
	   	obj.put("id", rs.getString("id"));
	   	obj.put("comment", rs.getString("comment"));
	   	obj.put("regdate", rs.getString("regdate"));
	   	obj.put("good", rs.getString("good"));
	   	obj.put("dislike", rs.getString("dislike"));  	
	   	list.add(obj);
  }
  pstmt.close();
  rs.close();
  
  
   //정리 
   rs.close();
   pstmt.close();
  
   
   response.setContentType("application/json");
   out.print(list.toJSONString()); // json 형식으로 출력
%>

