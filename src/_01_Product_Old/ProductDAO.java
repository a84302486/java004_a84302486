package _01_Product_Old;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO {
	
	Context ctx;
	DataSource ds;

	public ProductDAO(){

		try {
			ctx = new InitialContext();
		} catch (NamingException e1) {
			e1.printStackTrace();
		}	
		try {
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Java004NO1");
		} catch (NamingException e1) {
			e1.printStackTrace();
		}
	}
	
		synchronized public String insert(ProductBean pb){
			
			String sql = "INSERT INTO Product "
					+ " VALUES(? ,?, ?, ?, ?, ?, ?)";
			
			try(
				Connection con = ds.getConnection();
				PreparedStatement pstmt	= con.prepareStatement(sql);
				){				
			
				pstmt.setString(1, pb.getProductId());
				pstmt.setInt(2, pb.getPgPrice());
				pstmt.setString(3, pb.getName());
				pstmt.setDouble(4, pb.getAvgCost());
				pstmt.setString(5, pb.getOplace());
				pstmt.setInt(6,  pb.getSlife());
				pstmt.setString(7, pb.getSuppierId());		
				pstmt.executeUpdate();
				
				System.out.println("成功 新增" + pb.getProductId());
				
				return null;
			}catch (Exception e){		
				System.out.println("失敗 新增" + pb.getProductId());
				e.printStackTrace();
				return "失敗 新增" + pb.getProductId();
			}	
		}
		
		public boolean delete(String productId){
		
			String sql = "DELETE FROM Product WHERE Product_id =? ;";
			try(
					Connection con = ds.getConnection();
					PreparedStatement pstmt	= con.prepareStatement(sql);
				){
				
				pstmt.setString(1, productId);
				pstmt.executeUpdate();
				System.out.println("成功 刪除 "+ productId);
				return true;
			}catch (SQLException e){
				System.out.println("失敗 刪除 "+ productId);
				e.printStackTrace();
				return false;
			}
			
		}
		
		synchronized public String update(ProductBean pb){
			
			String sql = "UPDATE Product SET "
					+ "product_id = ?, p_g_price = ?, name = ?, "
					+ "avg_cost = ?, o_place = ?, s_life = ?, suppier_id = ?"
					+ "WHERE product_id = ?;";
			
			try(
				Connection con = ds.getConnection();
				PreparedStatement pstmt	= con.prepareStatement(sql);){				
			
				pstmt.setString(1, pb.getProductId());
				pstmt.setInt(2, pb.getPgPrice());
				pstmt.setString(3, pb.getName());
				pstmt.setDouble(4, pb.getAvgCost());
				pstmt.setString(5, pb.getOplace());
				pstmt.setInt(6,  pb.getSlife());
				pstmt.setString(7, pb.getSuppierId());		
				pstmt.executeUpdate();
				
				System.out.println("成功 修改" + pb.getProductId());
				
				return null;
			}catch (Exception e){		
				System.out.println("失敗 修改" + pb.getProductId());
				e.printStackTrace();
				return "失敗 修改" + pb.getProductId();
			}
		}
		
//		public String findByPrimaryKey(String productId){
//			
//			String sql = "select * from Product where Product_id =?;";		 		
//			String Product_id = null;	
//			
//			try(
//				Connection con = ds.getConnection();
//				PreparedStatement pstmt	= con.prepareStatement(sql);){				
//			
//				pstmt.setString(1, productId);
//				try(
//					ResultSet rs = pstmt.executeQuery();
//				){
//					if (rs.next()){					
//						Product_id = rs.getString(1);					
//					}
//				}
//				return Product_id;
//			}catch (Exception e){
//				
//				e.printStackTrace();
//			}
//			return null;
//		}
		
		public Collection<ProductBean> findByPrimaryKey(String productId) {

			String sql = "select * from Product where product_id = ?;";

			Collection<ProductBean> coll = new ArrayList<>();
			try (Connection con = ds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
				
				pstmt.setString(1, productId);
				
				try (ResultSet rs = pstmt.executeQuery();) {
					
					while (rs.next()) {
						ProductBean pb = new ProductBean();
						pb.setProductId(rs.getString(1));
						pb.setPgPrice(rs.getInt(2));
						pb.setName(rs.getString(3));
						pb.setAvgCost(rs.getDouble(4));
						pb.setOplace(rs.getString(5));
						pb.setSlife(rs.getInt(6));
						pb.setSuppierId(rs.getString(7));
						coll.add(pb);
					}
					System.out.println("序號查詢資料");
				}
				return coll;
			} catch (Exception e) {

				e.printStackTrace();
			}
			return null;
		}
		
		public Collection<ProductBean> findAll() {

			String sql = "select * from Product;";

			Collection<ProductBean> coll = new ArrayList<>();
			try (Connection con = ds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql);
				){

				try (ResultSet rs = pstmt.executeQuery();) {

					while (rs.next()) {
						ProductBean pb = new ProductBean();
						pb.setProductId(rs.getString(1));
						pb.setPgPrice(rs.getInt(2));
						pb.setName(rs.getString(3));
						pb.setAvgCost(rs.getDouble(4));
						pb.setOplace(rs.getString(5));
						pb.setSlife(rs.getInt(6));
						pb.setSuppierId(rs.getString(7));
						coll.add(pb);
					}
					System.out.println("記錄 查詢all");
				}
				return coll;
			} catch (Exception e) {

				e.printStackTrace();
			}
			return null;
		}
		
		public Boolean ifExist(String productId){
			
			String sql = "select * from Member where M_Username =?;";
			try(
				Connection con = ds.getConnection();
				PreparedStatement pstmt	= con.prepareStatement(sql);){				
			
				pstmt.setString(1, productId);
				try(
					ResultSet rs = pstmt.executeQuery();
				){
					if (rs.next()){					
						return true;					
					}else{
						return false;
					}
					
				}
			}catch (Exception e){
				
				e.printStackTrace();
			}
			return null;
		}
	}
	

