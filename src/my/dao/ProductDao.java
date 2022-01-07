package my.dao;

import java.sql.*;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Product;
import my.model.Product;
import my.model.ProductListView;
import my.util.ConnectionProvider;
import my.util.JdbcUtil;

public class ProductDao {
   
   public void insert(Connection conn, Product product) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into product (pname,price,pcategory,pimage,pdate,pcount)"
               + " values(?,?,?,?,?,?)");
         pstmt.setString(1, product.getPname());
         pstmt.setInt(2, product.getPrice());
         pstmt.setString(3, product.getPcategory());
         pstmt.setString(4, product.getPimage());
         pstmt.setTimestamp(5, 
                 new Timestamp(product.getPdate().getTime()));
         pstmt.setInt(6, 0);
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public Product selectById(Connection conn, int pid) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Product product = null; 
      try {
         pstmt = conn.prepareStatement
         ("select * from product where pid = ?");
         pstmt.setInt(1, pid);
         rs = pstmt.executeQuery();
         if (rs.next()){
            product = new Product(); 
            product.setPid(rs.getInt(1));
            product.setPname(rs.getString(2));
            product.setPrice(rs.getInt(3));
            product.setPcategory(rs.getString(4));
            product.setPimage(rs.getString(5));
            product.setPdate(rs.getTimestamp(6));
            product.setPcount(rs.getInt(7));
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return product; 
   }
   
   
   
   public List<Product> selectLike(Connection conn, String target, String keyword) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Product product = null; 
      List<Product> products = new ArrayList<Product>();
      try {
         pstmt = conn.prepareStatement
         ("select * from product where " +target +" like ?");
         pstmt.setString(1, "%"+keyword+"%");
         rs = pstmt.executeQuery();
         while (rs.next()){
            product = new Product(); 
            product.setPid(rs.getInt(1));
            product.setPname(rs.getString(2));
            product.setPrice(rs.getInt(3));
            product.setPcategory(rs.getString(4));
            product.setPimage(rs.getString(5));
            product.setPdate(rs.getTimestamp(6));
            product.setPcount(rs.getInt(7));
            products.add(product);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return products;
   }
    public List<Product> selectCategory(Connection conn, String pcategory) 
            throws SQLException {
         PreparedStatement pstmt=null; 
         ResultSet rs = null;
         Product product = null; 
         List<Product> products = new ArrayList<Product>();
         try {
            pstmt = conn.prepareStatement
            ("select * from product where pcategory=?");
            pstmt.setString(1, pcategory);
            rs = pstmt.executeQuery();
            while (rs.next()){
               product = new Product(); 
               product.setPid(rs.getInt(1));
               product.setPname(rs.getString(2));
               product.setPrice(rs.getInt(3));
               product.setPcategory(rs.getString(4));
               product.setPimage(rs.getString(5));
               product.setPdate(rs.getTimestamp(6));
               product.setPcount(rs.getInt(7));
               products.add(product);
            }
         } catch (SQLException e){
            e.printStackTrace();
         } finally {
            JdbcUtil.close(conn);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
         }
         return products;
      }

   
   public void update(Connection conn, Product product) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("update product set pname=?,price=?,pcategory=?, "
               + "   pimage=?,pdate=? where pid=?");
         pstmt.setString(1, product.getPname());
         pstmt.setInt(2, product.getPrice());
         pstmt.setString(3, product.getPcategory());
         pstmt.setString(4, product.getPimage());
         pstmt.setTimestamp(5, new Timestamp(product.getPdate().getTime()));
         pstmt.setInt(6, product.getPid());
         
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   public void incPcount(Connection conn, int pid) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("update product set pcount= pcount+1 where pid=?");
         pstmt.setInt(1, pid);
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public void deleteById(Connection conn, int pid) 
         throws SQLException {
      PreparedStatement pstmt=null;       
      try {
         pstmt = conn.prepareStatement
         ("delete from product where pid = ?");
         pstmt.setInt(1, pid);
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
         rs = stmt.executeQuery("select count(*) from product");
         rs.next();
         return rs.getInt(1);
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(rs);
      }
   }
   
   public List<Product> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Product> productList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from product ");         
         rs  = pstmt.executeQuery(); 
         productList = new ArrayList<Product>();
         while (rs.next()){
            Product product = new Product();
            product.setPid(rs.getInt(1));
            product.setPname(rs.getString(2));
            product.setPrice(rs.getInt(3));
            product.setPcategory(rs.getString(4));
            product.setPimage(rs.getString(5));
            product.setPdate(rs.getTimestamp(6));
            product.setPcount(rs.getInt(7));
            productList.add(product);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return productList;
   }
   
   public List<Product> listByPcount(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Product> productList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from product order by pcount desc");         
         rs  = pstmt.executeQuery(); 
         productList = new ArrayList<Product>();
         while (rs.next()){
            Product product = new Product();
            product.setPid(rs.getInt(1));
            product.setPname(rs.getString(2));
            product.setPrice(rs.getInt(3));
            product.setPcategory(rs.getString(4));
            product.setPimage(rs.getString(5));
            product.setPdate(rs.getTimestamp(6));
            product.setPcount(rs.getInt(7));
            productList.add(product);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return productList;
   }
   
   public List<Product> listByPdate(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Product> productList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from product order by pdate desc");         
         rs  = pstmt.executeQuery(); 
         productList = new ArrayList<Product>();
         while (rs.next()){
            Product product = new Product();
            product.setPid(rs.getInt(1));
            product.setPname(rs.getString(2));
            product.setPrice(rs.getInt(3));
            product.setPcategory(rs.getString(4));
            product.setPimage(rs.getString(5));
            product.setPdate(rs.getTimestamp(6));
            product.setPcount(rs.getInt(7));
            productList.add(product);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return productList;
   }
      
      public List<Product> listByPrice(Connection conn) 
            throws SQLException {
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         List<Product> productList = null;
         try {
            pstmt = conn.prepareStatement
                  ("select * from product order by price");         
            rs  = pstmt.executeQuery(); 
            productList = new ArrayList<Product>();
            while (rs.next()){
               Product product = new Product();
               product.setPid(rs.getInt(1));
               product.setPname(rs.getString(2));
               product.setPrice(rs.getInt(3));
               product.setPcategory(rs.getString(4));
               product.setPimage(rs.getString(5));
               product.setPdate(rs.getTimestamp(6));
               product.setPcount(rs.getInt(7));
               productList.add(product);
            }
         } finally {
            JdbcUtil.close(conn);
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
         }
         return productList;
   }
      
   private static final int PRODUCT_COUNT_PER_PAGE = 5;

   public ProductListView getProductList(int pageNumber,Connection conn)
         throws SQLException {
      
      int currentPageNumber = pageNumber;
      try {
         int productTotalCount = selectCount(conn);
         List<Product> productList = null;
         int firstRow = 0;
         int endRow = 0;
         if (productTotalCount > 0) {
            firstRow =
            (pageNumber - 1) * PRODUCT_COUNT_PER_PAGE;
            endRow = PRODUCT_COUNT_PER_PAGE;
            productList =selectLimit(conn, firstRow, endRow);
         } else {
            currentPageNumber = 0;
            productList = Collections.emptyList();
         }
         return new ProductListView(productList,
               productTotalCount, currentPageNumber,
               PRODUCT_COUNT_PER_PAGE);
      } catch (SQLException e) {
         throw new SQLException("책 목록 구하기 실패: "
               + e.getMessage(), e);
      } finally {
         //JdbcUtil.close(conn);
      }
   }
   public List<Product> selectLimit(Connection conn, int firstRow, int endRow) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Product product = null; 
      List<Product> list = null;
      try {
         pstmt = conn.prepareStatement
         ("select * from product limit ?,?");
         pstmt.setInt(1, firstRow);
         pstmt.setInt(2, endRow);
         rs = pstmt.executeQuery();
         list = new ArrayList<Product>();
         while (rs.next()){
            product = new Product(); 
            product.setPid(rs.getInt(1));
            product.setPname(rs.getString(2));
            product.setPrice(rs.getInt(3));
            product.setPcategory(rs.getString(4));
            product.setPimage(rs.getString(5));
            product.setPdate(rs.getTimestamp(6));
            product.setPcount(rs.getInt(7));
            list.add(product);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return list;
   }
}
