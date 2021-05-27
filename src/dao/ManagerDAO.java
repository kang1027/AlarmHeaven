package dao;

import java.sql.*;
import java.util.ArrayList;

import jdbc.JDBCConn;
import vo.ManagerVO;

public class ManagerDAO {

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	
	public ArrayList<ManagerVO> ManagerList(){
		ArrayList<ManagerVO> managerList = null;
		try {
			conn = JDBCConn.DBCPConnection();
			String sql = "select * from manager";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			managerList = new ArrayList<ManagerVO>();
			while(rs.next()) {
				ManagerVO manager = new ManagerVO();
				
				manager.setManagerid(rs.getString("managerid"));
				manager.setManagerpw(rs.getString("managerpw"));
				manager.setManagerrank(rs.getString("managerrank"));
				
				managerList.add(manager);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCConn.close(conn, stmt, rs);
		}
		return managerList;
	}
}
