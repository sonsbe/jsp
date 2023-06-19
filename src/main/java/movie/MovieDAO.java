package movie;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;

public class MovieDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void addMovie(Movie movie) {
        try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "INSERT INTO Movie (title, description, genre, director, release_date, running_time, rating, poster) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, movie.getTitle());
            pstmt.setString(2, movie.getDescription());
            pstmt.setString(3, movie.getGenre());
            pstmt.setString(4, movie.getDirector());
            pstmt.setString(5, movie.getRelease_date());
            pstmt.setString(6, movie.getRunning_time());
            pstmt.setInt(7, movie.getRating());
            pstmt.setString(8, movie.getPoster());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
    }
	public void deleteMovie(int id) {
		try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "delete from Movie where movie_id = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
	}
	 public Movie getMovie(int id) {
	        Movie movie = null;

	        try {
	            // 데이터베이스 연결
	        	conn = JDBCUtil.getConnection();

	            // SQL 문 실행
	            String sql = "SELECT * FROM movie WHERE movie_id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, id);
	            rs = pstmt.executeQuery();

	            // 결과 처리
	            if (rs.next()) {
	            	movie = new Movie();
	                movie.setMovie_id(rs.getInt("movie_id"));
	                movie.setTitle(rs.getString("title"));
	                movie.setDescription(rs.getString("description"));
	                movie.setGenre(rs.getString("genre"));
	                movie.setDirector(rs.getString("director"));
	                movie.setRelease_date(rs.getString("release_date"));
	                movie.setRunning_time(rs.getString("running_time"));
	                movie.setRating(rs.getInt("rating"));
	                movie.setPoster(rs.getString("poster"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	        	JDBCUtil.close(rs, pstmt, conn);
	        }

	        return movie;
	    }
	 public List<Movie> getAllMovies() {
	        List<Movie> movieList = new ArrayList<>();

	        try {
	            // 데이터베이스 연결
	            conn = JDBCUtil.getConnection();

	            // SQL 문 실행
	            String sql = "SELECT * FROM movie";
	            pstmt = conn.prepareStatement(sql);
	            rs = pstmt.executeQuery();

	            // 결과 처리
	            while (rs.next()) {
	                Movie movie = new Movie();
	                movie.setMovie_id(rs.getInt("movie_id"));
	                movie.setTitle(rs.getString("title"));
	                movie.setDescription(rs.getString("description"));
	                movie.setGenre(rs.getString("genre"));
	                movie.setDirector(rs.getString("director"));
	                movie.setRelease_date(rs.getString("release_date"));
	                movie.setRunning_time(rs.getString("running_time"));
	                movie.setRating(rs.getInt("rating"));
	                movie.setPoster(rs.getString("poster"));

	                movieList.add(movie);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            JDBCUtil.close(rs, pstmt, conn);
	        }

	        return movieList;
	    }
}
