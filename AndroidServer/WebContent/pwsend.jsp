<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*, java.util.*, vo.*, org.apache.commons.mail.*" %>
<%
   
   
   //파라미터 읽기
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   
   PreparedStatement pstmt = vo.Dao.con.prepareStatement(
		   "select mail from member where id=?");
   //물음표 자리에 입력한 값을 삽입하기 
   pstmt.setString(1, id);
   
   ResultSet rs = pstmt.executeQuery();
   
   String mail = null;
   if(rs.next()){
	   mail = rs.getString("mail");
	   //새로운 비밀번호 생성
	   Random random = new Random();
	   String password = "";
	   for(int i=0; i<4; i++){
		   int r = random.nextInt(36);
		   if(r >= 0 && r < 25){
			   r = r + 97;
		   }else{
			   r = r + 22;
		   }
		   password = password + (char)r;
	   }
	   
	   boolean result = false;
		try {

			SimpleEmail  email = new SimpleEmail();
			// Smtp 서버 연결 설정.
			email.setHostName("smtp.naver.com");
			email.setSmtpPort(587);
			email.setAuthentication("yangha9828", "yanghyeok998877");
			String rt = "";
			// Smtp SSL, TLS 설정
			email.setSSL(true);
			email.setTLS(true);						
			email.setCharset("utf-8");
			// 받는 사람 설정
			email.addTo(mail, "받는 이", "utf-8");
			// 보내는 사람 설정
			email.setFrom("yangha9828@naver.com", "권양혁", "utf-8");

			// 제목 설정
			email.setSubject("새로운 비밀번호");
			

			// 본문 설정
			email.setMsg("새로운 비밀번호:" + password);

			email.send();
			result = true;

		} catch (Exception e) {
			System.out.println("메일 보내기 실패:" + e.getMessage());
			e.printStackTrace();
		}


	   
	   
	   
	   rs.close();
	   pstmt.close();
	   
	   //SQL 생성 
	   pstmt = vo.Dao.con.prepareStatement(
			   "update  member set password = ? where id=?");
	   password = org.mindrot.jbcrypt.BCrypt.hashpw(password, org.mindrot.jbcrypt.BCrypt.gensalt(10));
	   pstmt.setString(1, password);
	   pstmt.setString(2, id);
	   int r = pstmt.executeUpdate();
	   if(r > 0){
		   out.println("success");
	   }else{
		   out.println("fail");
	   }
   }else{
	   out.println("없는 아이디 입니다.");
   }
   	pstmt.close();
   %>
