package smartProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.MemberBean;



public class ProductMgr {

	private final String JDBC_Driver="com.mysql.jdbc.Driver";
	private final String JDBC_URL="jdbc:mysql://localhost:3306/smartproject";
	private final String USER="root";
	private final String PASS="nm9410";

    public ProductMgr() {
        try {
			Class.forName(JDBC_Driver);
        } catch (Exception e) {
            System.out.println("Error !!");
  
        }
    }

    public boolean insertProduct(HttpServletRequest req, String userid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        
            //String uploadDir = "C:/data/";
   //         String uploadDir = this.getClass().getResource("").getPath();
   //         uploadDir=uploadDir.substring(1, uploadDir.indexOf(".metadata"))+"jspImage1125/WebContent/datafiles";
   //         MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
           
            String saveFolder="/datafiles";   //파일 업로드 폴더
            //웹어플리케이션상의 절대 경로
            ServletContext context = req.getServletContext();
            String realFolder= context.getRealPath(saveFolder);
            MultipartRequest multi = new MultipartRequest(req, realFolder, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
 
		    con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

			String query = "insert into shop_product(name, price, detail, date, stock, image,userid)"
                    + "values(?, ?, ?, now(), ?, ?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
            pstmt.setString(4, multi.getParameter("stock"));

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));   // multi.getFilesystemName("image")
            }
            pstmt.setString(6, userid);
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

    public ProductBean getProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductBean product = null;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "select * from shop_product where no=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setUserid(rs.getString("userid"));
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
        return product;

    }

    public boolean updateProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
 //       String uploadDir="C:/data/";
       // String uploadDir="/datafiles";   //파일 업로드 폴더
        String saveFolder="/datafiles";
        ServletContext context = req.getServletContext();
        String uploadDir= context.getRealPath(saveFolder);
        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update shop_product set name = ?, price = ?, detail = ?, stock = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getParameter("no"));
            } else {
                String query = "update shop_product set name =? ,price = ?, detail = ?,stock = ?, image = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                if (multi.getFilesystemName("image") == null) {
                    pstmt.setString(5, "ready.gif");
                } else {
                    pstmt.setString(5, multi.getFilesystemName("image"));   // multi.getFilesystemName("image")
                }
                pstmt.setString(6, multi.getParameter("no"));
            }
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

    public void reduceProduct(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "update shop_product set stock = (stock - ? ) where no = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());
            pstmt.setString(2, order.getProduct_no());
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


    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String query = "select * from shop_product order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setUserid(rs.getString("userid"));
                vProduct.add(product);
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
        return vProduct;
    }


    public boolean deleteProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "delete from shop_product where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
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
    
    
    public boolean insertCart(String productid, String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {

			con = DriverManager.getConnection(JDBC_URL,USER ,PASS );
			sql = "insert into cart (productid,userid)"
					+ "values(?,?)";
			//pstmt = con.prepareStatement("insert into MEMBER values(?,?,?,?,?,?,?,?,?,?)");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productid);
			pstmt.setString(2, userid);
			
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
		}
		return flag;
	}
   
    
    public Vector getMyProduct(String userid) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String sql = "select * from shop_product where userid=?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, userid);
           
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setUserid(rs.getString("userid"));
                vProduct.add(product);
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
        return vProduct;
    }
    
    
    public Vector getCart(String userid) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String sql = "select * from shop_product,  cart where  shop_product.no=cart.productid";
           
           pstmt = con.prepareStatement(sql);
         //  pstmt.setString(1, userid);
          // pstmt.setString(2, userid);
           
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setUserid(rs.getString("userid"));
                vProduct.add(product);
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
        return vProduct;
    }
    
    
    public boolean deleteCart(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

            String query = "delete from cart where productid = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
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
    
    
    public Vector getSearch(String sch) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String sql = "select * from shop_product where  name = ?";
           
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, sch);
          // pstmt.setString(2, userid);
           
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setUserid(rs.getString("userid"));
                vProduct.add(product);
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
        return vProduct;
        
        
        
    }
    
    public boolean singo(String id, String rea) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {

			con = DriverManager.getConnection(JDBC_URL,USER ,PASS );
			sql = "insert into singo (id,reason)"
					+ "values(?,?)";
			//pstmt = con.prepareStatement("insert into MEMBER values(?,?,?,?,?,?,?,?,?,?)");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, rea);
			
			
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if(pstmt != null) 
					try{pstmt.close();}catch(SQLException sqle){}
				 if(con != null) 
					try{con.close();}catch(SQLException sqle){}
		}
		return flag;
	}
    
    
    public Vector getBlackList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           String query = "select * from singo";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                BlackListBean BlackList = new BlackListBean();
                BlackList.setId(rs.getString("id"));
                BlackList.setReason(rs.getString("reason"));
                
                vProduct.add(BlackList);
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
        return vProduct;
    }

    
    
    public Vector getProductListbYCategory(String cate) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
			 con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

           //String query = "select * from shop_product where category = ? order by no desc";
			 String query = "select * from shop_product where  category = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cate);
			

	
	            
			
			 rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setUserid(rs.getString("userid"));
                vProduct.add(product);
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
        return vProduct;
    }
    
    
    public boolean insertAcc(HttpServletRequest req, String userid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        
            //String uploadDir = "C:/data/";
   //         String uploadDir = this.getClass().getResource("").getPath();
   //         uploadDir=uploadDir.substring(1, uploadDir.indexOf(".metadata"))+"jspImage1125/WebContent/datafiles";
   //         MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
           
            String saveFolder="/datafiles";   //파일 업로드 폴더
            //웹어플리케이션상의 절대 경로
            ServletContext context = req.getServletContext();
            String realFolder= context.getRealPath(saveFolder);
            MultipartRequest multi = new MultipartRequest(req, realFolder, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
 
		    con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

			String query = "insert into shop_product(name, price, detail, date, stock, image,userid,category)"
                    + "values(?, ?, ?, now(), ?, ?,?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
            pstmt.setString(4, multi.getParameter("stock"));
            

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));   // multi.getFilesystemName("image")
            }
            pstmt.setString(6, userid);
            pstmt.setString(7, "1");
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
    
    public boolean insertCloth(HttpServletRequest req, String userid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        
            //String uploadDir = "C:/data/";
   //         String uploadDir = this.getClass().getResource("").getPath();
   //         uploadDir=uploadDir.substring(1, uploadDir.indexOf(".metadata"))+"jspImage1125/WebContent/datafiles";
   //         MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
           
            String saveFolder="/datafiles";   //파일 업로드 폴더
            //웹어플리케이션상의 절대 경로
            ServletContext context = req.getServletContext();
            String realFolder= context.getRealPath(saveFolder);
            MultipartRequest multi = new MultipartRequest(req, realFolder, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
 
		    con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

			String query = "insert into shop_product(name, price, detail, date, stock, image,userid,category)"
                    + "values(?, ?, ?, now(), ?, ?,?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
            pstmt.setString(4, multi.getParameter("stock"));
            

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));   // multi.getFilesystemName("image")
            }
            pstmt.setString(6, userid);
            pstmt.setString(7, "2");
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
    
    public boolean insertETC(HttpServletRequest req, String userid) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
        
            //String uploadDir = "C:/data/";
   //         String uploadDir = this.getClass().getResource("").getPath();
   //         uploadDir=uploadDir.substring(1, uploadDir.indexOf(".metadata"))+"jspImage1125/WebContent/datafiles";
   //         MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
           
            String saveFolder="/datafiles";   //파일 업로드 폴더
            //웹어플리케이션상의 절대 경로
            ServletContext context = req.getServletContext();
            String realFolder= context.getRealPath(saveFolder);
            MultipartRequest multi = new MultipartRequest(req, realFolder, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
 
		    con=DriverManager.getConnection(JDBC_URL,USER ,PASS );

			String query = "insert into shop_product(name, price, detail, date, stock, image,userid,category)"
                    + "values(?, ?, ?, now(), ?, ?,?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
            pstmt.setString(4, multi.getParameter("stock"));
            

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));   // multi.getFilesystemName("image")
            }
            pstmt.setString(6, userid);
            pstmt.setString(7, "3");
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

}