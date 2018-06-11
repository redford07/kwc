package smartProject;

import java.sql.*;
import java.util.Vector;


public class MemberMgr {

	private final String JDBC_Driver="com.mysql.jdbc.Driver";
	private final String JDBC_URL="jdbc:mysql://localhost:3306/smartproject";
	private final String USER="root";
	private final String PASS="nm9410";

    public MemberMgr() {
        try {
			Class.forName(JDBC_Driver);
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

			 String strQuery = "select id from member where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return checkCon;
    }

 /*   public Vector zipcodeRead(String area3) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        try {
            con = pool.getConnection();
            String strQuery = "select * from zipcode where area3 like '" + area3 + "%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }*/

    public boolean memberInsert(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String strQuery = "insert into member values(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_id());
            pstmt.setString(2, regBean.getMem_passwd());
            pstmt.setString(3, regBean.getMem_name());
            pstmt.setString(4, regBean.getMem_email());
            pstmt.setString(5, regBean.getMem_phone());
            pstmt.setString(6, regBean.getMem_address());
            pstmt.setString(7, regBean.getMem_job());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
 				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return flag;
    }

    public RegisterBean getMember(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean regBean = null;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String strQuery = "select * from member where id=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new RegisterBean();
                regBean.setMem_id(rs.getString("id"));
                regBean.setMem_passwd(rs.getString("passwd"));
                regBean.setMem_name(rs.getString("name"));
                regBean.setMem_phone(rs.getString("phone"));
                regBean.setMem_address(rs.getString("address"));
                regBean.setMem_email(rs.getString("e_mail"));
                regBean.setMem_job(rs.getString("job"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return regBean;
    }

    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String strQuery = "select * from member";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                RegisterBean regBean = new RegisterBean();
                regBean.setMem_id(rs.getString("id"));
                regBean.setMem_passwd(rs.getString("passwd"));
                regBean.setMem_name(rs.getString("name"));
                regBean.setMem_phone(rs.getString("phone"));
                regBean.setMem_email(rs.getString("e_mail"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(stmt != null) 
					try{stmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return vecList;
    }

    public boolean memberUpdate(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String strQuery = "update member set passwd=?, name=?,";
            strQuery = strQuery + " e_mail=?, phone=?, address=?,job=?";
            strQuery = strQuery + " where id=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_passwd());
            pstmt.setString(2, regBean.getMem_name());
            pstmt.setString(3, regBean.getMem_email());
            pstmt.setString(4, regBean.getMem_phone());
            pstmt.setString(5, regBean.getMem_address());
            pstmt.setString(6, regBean.getMem_job());
            pstmt.setString(7, regBean.getMem_id());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
 				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return flag;
    }

    public boolean loginCheck(String id, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String strQuery = "select id, passwd from member where id = ? and passwd = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return loginCon;
    }

    public boolean adminCheck(String admin_id, String admin_passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String strQuery = "select admin_id, admin_passwd from admin where admin_id = ? and admin_passwd = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            pstmt.setString(2, admin_passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return loginCon;
    }
}
