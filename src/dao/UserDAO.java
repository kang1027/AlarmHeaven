package dao;

import java.sql.*;
import java.util.ArrayList;

import jdbc.JDBCConn;
import vo.UserVO;

public class UserDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public ArrayList<UserVO> UserList() {
		ArrayList<UserVO> userList = null;
		try {
			conn = JDBCConn.DBCPConnection();
			String sql = "select * from login";
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();

			userList = new ArrayList<UserVO>();

			while (rs.next()) {
				UserVO user = new UserVO();

				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));

				userList.add(user);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCConn.close(conn, stmt, rs);
		}
		return userList;
	}
}
