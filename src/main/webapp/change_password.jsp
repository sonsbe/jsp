<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UsersDAO" %>
<%@ page import="user.Users" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Users user = new Users();
		String userId = (String) session.getAttribute("userId");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		UsersDAO usersDAO = new UsersDAO();
		user = usersDAO.getUser(userId, password);
		
		if(user != null){
			usersDAO.changePassword(userId, password, cpassword);
			%>
			<script>
	 			alert("비밀번호 변경 완료");
	 			location.href="mypage.jsp"
			</script>
			<%
		}
		else if(user == null){
			%>
			<script>
	 			alert("유효하지 않은 비밀번호입니다!");
	 			location.href="changePassword.jsp"
			</script>
			<%
		}
		
	%>
</body>
</html>