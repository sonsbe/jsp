package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;
import movie.Movie;

public class UsersDAO {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
    public void addUser(Users user) {
        

        try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "INSERT INTO users (user_id, username, password, email, phone_number) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUser_id());
            pstmt.setString(2, user.getUser_name());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone_number());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
    }
    public String findId(String name, String phoneNumber) {
        String foundId = null;

        try {
            // 데이터베이스 연결
            conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "SELECT user_id FROM users WHERE username = ? AND phone_number = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, phoneNumber);
            rs = pstmt.executeQuery();

            // 결과 처리
            if (rs.next()) {
                foundId = rs.getString("user_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }

        return foundId;
    }
    public void deleteUsers(String id, String password) {
		try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "delete from users where user_id = ? and password = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
	}
    public void updateUser(String id, String email, String phone_number) {
		try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "update users set email= ?,phone_number =? where user_id= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2,phone_number);
            pstmt.setString(3, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
	}
    public void changePassword(String id, String password, String cpassword) {
		try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "update users set password= ? where user_id= ? and password = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cpassword);
            pstmt.setString(2, id);
            pstmt.setString(3, password);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제
        	  JDBCUtil.close(pstmt, conn);
        }
	}
    public boolean checkId(String id) {
        Users user = null;

        try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "SELECT * FROM users WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            // 결과 처리
            if (rs.next()) {
                user = new Users();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	JDBCUtil.close(rs, pstmt, conn);
        }
        if(user!=null) {
        	return true;
        }
        else {
        	return false;
        }
    }
    public Users getUser(String id, String password) {
        Users user = null;

        try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "SELECT * FROM users WHERE user_id = ? and password= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            // 결과 처리
            if (rs.next()) {
                user = new Users();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_name(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	JDBCUtil.close(rs, pstmt, conn);
        }

        return user;
    }
    public Users getUserById(String id) {
        Users user = null;

        try {
            // 데이터베이스 연결
        	conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "SELECT * FROM users WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            // 결과 처리
            if (rs.next()) {
                user = new Users();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_name(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	JDBCUtil.close(rs, pstmt, conn);
        }

        return user;
    }
    public List<Users> getAllUsers() {
        List<Users> userList = new ArrayList<>();

        try {
            // 데이터베이스 연결
            conn = JDBCUtil.getConnection();

            // SQL 문 실행
            String sql = "SELECT * FROM users";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                Users user = new Users();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_name(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getString("phone_number"));

                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }

        return userList;
    }
}