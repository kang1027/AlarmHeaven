package dao;

import java.sql.*;
import java.util.ArrayList;

import jdbc.JDBCConn;
import vo.QuizVO;

public class QuizDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public ArrayList<QuizVO> QuizList() {
		ArrayList<QuizVO> quizList = null;
		try {
			conn = JDBCConn.DBCPConnection();
			String sql = "select * from testquiz";
			stmt = conn.prepareStatement(sql);

			rs = stmt.executeQuery();
			quizList = new ArrayList<QuizVO>();
			while (rs.next()) {
				QuizVO quiz = new QuizVO();

				quiz.setQuiztype(rs.getString("quiztype"));
				quiz.setQuestion(rs.getString("question"));
				quiz.setAnswer(rs.getString("answer"));
				quizList.add(quiz);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCConn.close(conn, stmt, rs);
		}
		return quizList;
	}
}
