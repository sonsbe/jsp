<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDO, board.BoardDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script>
let selectedBoardSeq = null;

function selectBoard(seq, element) {
    const previouslySelectedItem = document.querySelector('.selected-item');
    if (previouslySelectedItem) {
        previouslySelectedItem.classList.remove('selected-item');
    }
    element.classList.add('selected-item');
    selectedBoardSeq = seq;
}

function deleteBoard() {
    if (selectedBoardSeq) {
        fetch('remove_board.jsp?seq=' + selectedBoardSeq, {
            method: 'GET',
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            window.location.reload();
        })
        .catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
        });
    } else {
        alert('Please select a board to delete.');
    }
}
</script>

<style>
	.container {
        display: flex;
    	flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 40px;
        width: 90vw;   
    }
    .selected-item {
    background-color: #c0c0c0  !important;
    color: black !important;
}
</style>
</head>
<body>
    <jsp:include page="./admin_header.jsp" />
    <div class="container">
        <div class="list-group">
            <%
            BoardDAO boardDAO = new BoardDAO();
            List<BoardDO> boards = boardDAO.getBoardList(null, null); // 모든 게시글 정보 가져오기

            for (BoardDO board : boards) {
            %>
            <a href="#" class="list-group-item list-group-item-action" onClick="selectBoard(<%= board.getSeq() %>, this)">
                <%= board.getSeq() %> : <%= board.getTitle() %>
            </a>
            <%
            }
            %>
        </div>

        <div class="form-container" style="text-align: center; margin-top: 10px;">
            <button onClick="deleteBoard()">Delete Selected Board</button>
        </div>
    </div>
</body>
</html>