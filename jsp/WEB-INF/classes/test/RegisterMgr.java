package test;

 import java.sql.*;
import java.util.Vector;

import sun.font.CreatedFontTracker;
 
 public class RegisterMgr {
    
 	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
 	private final String JDBC_URL = "jdbc:mysql://localhost:3306/textdb?" +
 	       "useUnicode=true&characterEncoding=utf8";
 	private final String USER = "root";
 	private final String PASS = "nm9410";
 
 	public RegisterMgr() {
 	 try{
 		Class.forName("com.mysql.jdbc.Driver");
 	   }catch(Exception e){
 	      System.out.println("Error : JDBC 드라이버 로딩 실패");
 	   }
     }//RegisterMgr()
 
    public Vector getMemberList() {
	   Connection conn = null;
	   Statement stmt = null;
       ResultSet rs = null;
       Vector vecList = new Vector();
       
       try {
          conn = DriverManager.getConnection(JDBC_DRIVER, USER, PASS);
          String strQuery = "select * from member";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
             MemberBean regBean = new MemberBean();
		 	 regBean.setId (rs.getString("id"));
			 regBean.setPass (rs.getString("password"));
 			 regBean.setName (rs.getString("name"));
 			 regBean.setSex (rs.getString("sex"));
 			 regBean.setBirthday (rs.getString("birthday"));
 			 regBean.setEmail (rs.getString("email"));
 			 regBean.setZipcode (rs.getString("zipcode"));
 			 regBean.setAddress (rs.getString("address"));
 			String hobbys[] = new String[5];
			String hobby = rs.getString("hobby");// 01001
			for (int i = 0; i < hobbys.length; i++) {
				hobbys[i] = hobby.substring(i, i + 1);
			}
			
 			 regBean.setJob (rs.getString("job"));
 			 
 			 
             vecList.add(regBean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
          if(rs!=null)   try{rs.close();}  catch(SQLException e){}
		  if(stmt!=null) try{stmt.close();}catch(SQLException e){}
	      if(conn!=null) try{conn.close();}catch(SQLException e){}
       }
       return vecList;
    }
    
    
 }//class