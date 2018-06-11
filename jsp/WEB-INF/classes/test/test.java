package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class test {

	public test() {
		// TODO Auto-generated constructor stub
		
		public void updatemember1(MemberBean member){
			
			 Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				MemberBean bean = null;
			try {

						StringBuffer query = new StringBuffer();
			
			query.append("update member set");
					query.append("password=?, email=?, phone=?, address=?");
			query.append("where id=?");
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(query.toString());
			
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getSex());
			
			pstmt.executeUpdate();
			con.commit();
			

			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			} 
		 }
	}

}
