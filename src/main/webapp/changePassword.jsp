<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            transform: translateY(-20%);
        }
        .login-box {
            width: 400px;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        .login-box h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-box .form-control {
            margin-bottom: 10px;
        }
        .login-box .btn {
            width: 100%;
        }
    </style>
</head>
<body>
<%
	String userId = (String) session.getAttribute("userId");
%>
<jsp:include page="./mypage_header.jsp" />
<div class="container">
    <div class="login-box">
        <h2>비밀번호 변경</h2>
        <form action="change_password.jsp" method="get">
            <input type="password" name="password" class="form-control" placeholder="현재 비밀번호">
            <input type="password" name="cpassword" class="form-control" placeholder="변경할 비밀번호">
            <input type="submit" value="변경" class="btn btn-primary mt-3">
        </form>
    </div>
</div>
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-beta1/js/bootstrap.bundle.min.js"></script>
</body>
</html>