<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.Users" %>
<%@ page import="user.UsersDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<title>유저 관리</title>
<style>
	.container {
        display: flex;
    	flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 40px;
        width: 90vw;   
    }
    }
    h2{
    	text-align: center;
    }
    .table-container{
     	margin-top: 20px; /* 테이블과 h2 사이에 여백 추가 */
    	display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
   
    .form-container {
        text-align: center;
    }
        
</style>
</head>
<body>
	<jsp:include page="./admin_header.jsp" />
	<div class="container">
     <table class="table table-striped">
        
        <%
        UsersDAO usersDAO = new UsersDAO();
        List<Users> users = usersDAO.getAllUsers(); // 모든 영화 정보 가져오기
		%>
        <tr>
        <th scope="col">ID</th>
        <th scope="col">name</th>
    	</tr>
    	<%
        for (Users user : users) {
        	if(user.getUser_id().equals("admin")){
        		continue;
        	}
        %>
        
        <tr>
            
            <td><%= user.getUser_id() %></td>
            <td><%= user.getUser_name() %></td>
        </tr>
        <%
        }
        %>
    </table>

        </div>
</body>
</html>