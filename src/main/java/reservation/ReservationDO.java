package reservation;

public class ReservationDO {
	private int reservation_id;
	private String user_id;
	private String movie_id;
	private String seat_number;
	
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String screening_id) {
		this.movie_id = screening_id;
	}
	public String getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}
	
}
