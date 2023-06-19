<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %> 
<%@ page import="board.BoardDO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.List" %>


<%
   request.setCharacterEncoding("UTF-8");
   String searchField = ""; //검색 대상(즉, 제목 or 작성자)
   String searchText = "";  //검색 내용
   if(request.getParameter("searchCondition")!="" && request.getParameter("searchKeyword")!=""){
      searchField= request.getParameter("searchCondition");
      searchText = request.getParameter("searchKeyword");
   }
   
   BoardDAO boardDAO = new BoardDAO();
   List<BoardDO> boardList = boardDAO.getBoardList(searchField, searchText);
   
   request.setAttribute("boardList", boardList);
	// session과 request 차이점 : request는 현재 페이지 / session은 여러 페이지에서 공유할 때 쓴다.
	
   request.setAttribute("totalList", boardList.size());
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoardList 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	#body{
		display: flex;
	}
   #div_box {
      justify-content:center;
   }
   #addBoard{
   	text-align:right;
   	padding: 1%;
   }
   #boardList{
   
   }
</style>
</head>
<body>
 <jsp:include page="./header.jsp" />
   <div id="div_box">
      <h1 style="text-align:center; padding-top:5%;">전체 리뷰</h1>
      <form name="boardListForm" method="POST" action="getBoardList.jsp">
         <p style="text-align:right; padding:1%;">총 게시글: ${totalList} 건 </p>
         <!-- <table border="1" cellpadding="0" cellspacing="0" width="700">
            <tr>
               <td align="right">
                  <select name="searchCondition">
                     <option value="TITLE">제목</option>
                     <option value="WRITER">작성자</option>
                     <input name="searchKeyword" type="text" />
                     <input type="submit" value="검색" />
                  </select>
               </td>
            </tr>
         </table> -->
         <div id="addBoard"><a href="insertBoard.jsp">
      	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
		  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
		  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
		</svg></a>
     	 </div>
      </form>
      <table class="table table-striped table table-bordered">
         <tr style="text-align:center;">
            <th bgcolor="#e9ecef">영화제목</th>
            <th bgcolor="#e9ecef">작성자</th>
            <th bgcolor="#e9ecef">내용</th>
            <th bgcolor="#e9ecef">조회수</th>
         </tr>   
         
         <%-- 방법 1
         <%
            for(BoardDO board : boardList){
         %>
            <tr>
               <td align="center"><%= board.getSeq() %></td>
               <td align="left"><a href="getBoard.jsp?seq=<%= board.getSeq()%>"><%=board.getTitle() %></a></td>
               <!-- 제목으로 갈 때 게시글 번호를 같이 넘겨줘라. -->
               <td align="center"><%= board.getWriter() %></td>
               <td align="center"><%= board.getRegdate()%></td>
               <td align="center"><%= board.getCnt() %></td>
            </tr>
         <% } %>
         --%>
         
         <%-- 방법 2 표현 언어와 JSTL을 적용하여 소스 변경 --%>
         <c:forEach var="board" items="${boardList}">
            <tr>
               <td align="left"><a href="getBoard.jsp?seq=${board.seq}">${board.title}</a></td>
               <td align="center">${board.writer}</td>
               <td align="center">${board.content}</td>
               <td align="center">${board.cnt}</td>
            </tr>      
         </c:forEach>
         
      </table>
      <br>
      <!-- 
      <div id="boardList"><a href="getBoardList.jsp">리뷰 목록</a>&nbsp;&nbsp;&nbsp;</div>
       -->
   </div>
</body>
</html>