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
   PreparedStatement pstmt = vo.Dao.con.prepareStatement("select id from member where id = ? ");
   pstmt.setString(1,id);
   ResultSet rs = pstmt.executeQuery();
   if(rs.next()){
	   	list.add(rs.getString("id"));
  }else{
	  list.add("찾는 친구가 없습니다.");
  }
  pstmt.close();
  rs.close();
  
  
   //정리 
   rs.close();
   pstmt.close();
   
   
   response.setContentType("application/json");
   out.print(list.toJSONString()); // json 형식으로 출력
%>

