<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.Movie, movie.MovieDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>영화 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script>
let selectedMovieId = null;

function selectMovie(id, element) {
    // Remove selected class from the previously selected item
    const previouslySelectedItem = document.querySelector('.selected-item');
    if (previouslySelectedItem) {
        previouslySelectedItem.classList.remove('selected-item');
    }

    // Add selected class to the clicked item
    element.classList.add('selected-item');

    // Set the selected movie id
    selectedMovieId = id;
}

function deleteMovie() {
    if (selectedMovieId) {
        fetch('remove_movie.jsp?id=' + selectedMovieId, {
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
        alert('Please select a movie to delete.');
    }
}
</script>

<style>
    .selected-item {
    background-color: #c0c0c0  !important;
    color: black !important;
}
.container {
        display: flex;
    	flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 40px;
        width: 90vw;   
    }
</style>
</head>
<body>
    <jsp:include page="./admin_header.jsp" />
    <div class="container">
        <div class="list-group">
            <%
            MovieDAO movieDAO = new MovieDAO();
            List<Movie> movies = movieDAO.getAllMovies(); // 모든 영화 정보 가져오기

            for (Movie movie : movies) {
            %>
            <a href="#" class="list-group-item list-group-item-action" onClick="selectMovie(<%= movie.getMovie_id() %>, this)">
                <%= movie.getMovie_id() %> : <%= movie.getTitle() %>
            </a>
            <%
            }
            %>
        </div>

        <div class="form-container" style="text-align: center; margin-top: 10px;">
            <button onClick="deleteMovie()">Delete Selected Movie</button>
        </div>
    </div>
</body>
</html>