<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
//데이터베이스 접속 객체 생성

//입력한 데이터 가져오기 
request.setCharacterEncoding("utf-8");

//SQL 만들기
PreparedStatement pstmt = vo.Dao.con.prepareStatement("select * from member where id = ? ");
pstmt.setString(1,id);

//SQL 실행 
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
	out.println("fail");
}else{
	out.println("success");
}
rs.close();
pstmt.close();

%>