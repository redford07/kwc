package smartProject;


import java.sql.*;
import java.util.Vector;


public class OrderMgr {

	private final String JDBC_Driver="com.mysql.jdbc.Driver";
	private final String JDBC_URL="jdbc:mysql://localhost:3307/smartproject";
	private final String USER="root";
	private final String PASS="nm9410";

    public OrderMgr() {
        try {
			Class.forName(JDBC_Driver);
        } catch (Exception e) {
            System.out.println("Error : 커넥션 가져오기 실패!!");
        }
    }


    public void insertOrder(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String query = "insert into shop_order(id, product_no, quantity, date, state)"
                    + " values(?, ?, ? ,now() ,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, order.getId());
            pstmt.setString(2, order.getProduct_no());
            pstmt.setInt(3, order.getQuantity());
            pstmt.setString(4, "1");
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
 				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
    }


    public Vector getOrder(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String query = "select * from shop_order where id = ? order by no desc";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return vResult;
    }


    public Vector getOrderList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "select * from shop_order order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(stmt != null) 
					try{stmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return vResult;
    }


    public OrderBean getOrderDetail(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OrderBean order = null;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "select * from shop_order where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                order.setNo(rs.getString("no"));
                order.setState(rs.getString("state"));
                order.setProduct_no(rs.getString("product_no"));
            }
        } catch (Exception e) {
            System.out.println("Exception :" + e);
        } finally {
			 if(rs != null) 
				    try{rs.close();}catch(SQLException sqle){}
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return order;
    }


    public boolean updateOrder(String no, String state) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "update shop_order set state = ? where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, state);
            pstmt.setString(2, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
 				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return result;
    }


    public boolean deleteOrder(String no) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "delete from shop_order where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception e) {
            System.out.println("Exception :" + e);
        } finally {
				 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
        }
        return result;
    }


}
