<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UsersDAO" %>
<%@ page import="user.Users" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pn = request.getParameter("phone_number");
		Users user = new Users();
		UsersDAO usersDAO = new UsersDAO();
		String id = usersDAO.findId(name, pn);
		
		if(id!=null){
			%>
			<script>
	 			alert("당신의 아이디는 <%=id%>입니다.");
	 			location.href="login.jsp"
			</script>
			
			<%
		}
		else if(id==null){
			%>
			<script>
	 			alert("일치하는 사용자가 없습니다..");
	 			location.href="findId.jsp"
			</script>
			<%
		}
			
		
		
	%>
</body>
</html>