package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;
import movie.Movie;

public class ReservationDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

    // 생성자를 통해 데이터베이스 연결을 초기화합니다.
   /*
	public ReservationDAO() {
    		try {
            
            conn = JDBCUtil.getConnection();
            
            String sql = "SELECT *FROM MOVIE";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();	
            
            while(rs.next()) {
               ReservationDO reservation = new ReservationDO();
               reservation.setReservation_id(rs.getInt("reservation_id"));
               reservation.setUser_id(rs.getString("user_id"));
               reservation.setMovie_id(rs.getString("movie_id"));
               reservation.setSeat_number(rs.getString("seat_number"));
               reservation.setReservation_date(rs.getString("reservation_date"));
            }
           
            
         } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
         } finally {
            JDBCUtil.close(rs, pstmt, conn);
         }

    }
*/
    // 영화 리스트를 가져오는 메서드
	public List<String> getTitles(String id) {
	    List<String> titles = new ArrayList<>();
	    try {
	        // SQL 문 실행
	        conn = JDBCUtil.getConnection();
	        String sql = "SELECT * FROM reservation where user_id=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1,id);
	        rs = pstmt.executeQuery();

	        // 결과 처리
	        while (rs.next()) {
	            String movie_id = rs.getString("movie_id");
	            titles.add(movie_id);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 해제
	        JDBCUtil.close(rs, pstmt, conn);
	    }

	    return titles;
	}
    public void addReservation(ReservationDO reservation) {
    	try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "insert into reservation(user_id,movie_id,seat_number) values(?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,reservation.getUser_id());
            pstmt.setString(2, reservation.getMovie_id());
            pstmt.setString(3, reservation.getSeat_number());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
    }
    public List<ReservationDO> getAllReservation() {
        List<ReservationDO> reservationList = new ArrayList<>();

        try {
            // SQL 문 실행
        	conn = JDBCUtil.getConnection();
            String sql = "SELECT * FROM reservation";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                ReservationDO reservation = new ReservationDO();
                reservation.setReservation_id(rs.getInt("reservation_id"));
                reservation.setUser_id(rs.getString("user_id"));
                reservation.setMovie_id(rs.getString("movie_id"));
                reservation.setSeat_number(rs.getString("seat_number"));
                reservationList.add(reservation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
            JDBCUtil.close(rs, pstmt, conn);
        }

        return reservationList;
    }
}