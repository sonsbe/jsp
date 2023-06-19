<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>메인 페이지</title>
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 50px;
            background-color: #f8f9fa;
        }
        .logo {
            font-size: 30px;
            font-weight: bold;
        }
        .user-info {
            display: flex;
            gap: 20px;
        }
        .nav {
            display: flex;
            justify-content: space-around;
            background-color: #e9ecef;
            padding: 10px 50px;
        }
        a {
         	position: relative;
    		z-index: 1;
            color: #212529;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="header">
    <a href="./main.jsp">
        <div class="logo">Cinus</div>
    </a>
        <div class="user-info">
         	<% 
                String userId = (String) session.getAttribute("userId");
                if (userId != null) {
            %>
            <a href="./logout.jsp">로그아웃</a>
            <a href="./mypage.jsp">마이페이지</a>
            <% } else { %>
            <a href="./login.jsp">로그인</a>
            <a href="./signup.jsp">회원가입</a>
            <% } %>
            
        </div>
    </div>
    <div class="nav">
        <a href="./reservation.jsp">예매</a>
        <a href="./getBoardList.jsp">리뷰</a>
    </div>
</body>
</html>