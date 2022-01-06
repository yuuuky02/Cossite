package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Member;
import my.util.JdbcUtil;

public class MemberDao {
	
	public void insert(Connection conn, Member member) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into member values(?,?,?,?,?)");
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getNumber());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int checkLogin(Connection conn, String memberId, String password) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		//Member member = null; 
		try {
			pstmt = conn.prepareStatement
			("select password from member where memberId = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				if(rs.getNString(1).equals(password))
					return 1; // 로그인 성공
				else
					return 0; // 패스워드 다름
			}
			return -1; // 아이디 없음
		} catch (SQLException e){
			e.printStackTrace();
		} //finally {
			//JdbcUtil.close(conn);
			//JdbcUtil.close(pstmt);
			//JdbcUtil.close(rs);
		//}
		return -2; // 데이터베이스 오류
	}
	
	
	
	public Member selectById(Connection conn, String memberId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Member member = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from member where memberId = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				member = new Member(); 
				member.setMemberId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setNumber(rs.getString(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return member;
	}
	
	
	
	public void update(Connection conn, Member member) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update member set password=?,name=?,email=?,number=? where memberId=?");
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getNumber());
			pstmt.setString(5, member.getMemberId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String memberId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from member where memberId = ?");
			pstmt.setString(1, memberId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from member");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Member> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> memberList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from member ");			
			rs  = pstmt.executeQuery(); 
			memberList = new ArrayList<Member>();
			while (rs.next()){
				Member member = new Member();
				member.setMemberId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setEmail(rs.getString(4));
				member.setNumber(rs.getString(5));
				memberList.add(member);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return memberList;
	}
}




















