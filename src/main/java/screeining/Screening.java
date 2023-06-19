package screeining;

public class Screening {
	private String screening_id;
	private String movie_id;
	private String theater_id;
	private String start_time;
	private String end_time;
	public String getScreening_id() {
		return screening_id;
	}
	public void setScreening_id(String screening_id) {
		this.screening_id = screening_id;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
}
