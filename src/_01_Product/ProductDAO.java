package _01_Product;

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
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/java004");
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
			
				pstmt.setString(1, pb.getProduct_id());
				pstmt.setInt(2, pb.getP_g_price());
				pstmt.setString(3, pb.getName());
				pstmt.setDouble(4, pb.getAvg_cost());
				pstmt.setString(5, pb.getO_place());
				pstmt.setInt(6,  pb.getS_life());
				pstmt.setString(7, pb.getSuppier_id());		
				pstmt.executeUpdate();
				
				System.out.println("成功 新增" + pb.getProduct_id());
				
				return null;
			}catch (Exception e){		
				System.out.println("失敗 新增" + pb.getProduct_id());
				e.printStackTrace();
				return "失敗 新增" + pb.getProduct_id();
			}	
		}
		
		public void delete(String productId){
		
			String sql = "DELETE FROM Product WHERE Product_id =? ;";
			try(
					Connection con = ds.getConnection();
					PreparedStatement pstmt	= con.prepareStatement(sql);
				){
				
				pstmt.setString(1, productId);
				pstmt.executeUpdate();
				System.out.println("成功 刪除 "+ productId);
				
			}catch (SQLException e){
				System.out.println("失敗 刪除 "+ productId);
				e.printStackTrace();
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
			
				pstmt.setString(1, pb.getProduct_id());
				pstmt.setInt(2, pb.getP_g_price());
				pstmt.setString(3, pb.getName());
				pstmt.setDouble(4, pb.getAvg_cost());
				pstmt.setString(5, pb.getO_place());
				pstmt.setInt(6, pb.getS_life());
				pstmt.setString(7, pb.getSuppier_id());		
				pstmt.executeUpdate();
				
				System.out.println("成功 修改" + pb.getProduct_id());
				
				return null;
			}catch (Exception e){		
				System.out.println("失敗 修改" + pb.getProduct_id());
				e.printStackTrace();
				return "失敗 修改" + pb.getProduct_id();
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
						pb.setProduct_id(rs.getString(1));
						pb.setP_g_price(rs.getInt(2));
						pb.setName(rs.getString(3));
						pb.setAvg_cost(rs.getDouble(4));
						pb.setO_place(rs.getString(5));
						pb.setS_life(rs.getInt(6));
						pb.setSuppier_id(rs.getString(7));
		
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
		
		public Collection<ProductBean> findAll() {

			String sql = "select * from Product;";

			Collection<ProductBean> coll = new ArrayList<>();
			try (Connection con = ds.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql);
				){

				try (ResultSet rs = pstmt.executeQuery();) {

					while (rs.next()) {
						ProductBean pb = new ProductBean();
						pb.setProduct_id(rs.getString(1));
						pb.setP_g_price(rs.getInt(2));
						pb.setName(rs.getString(3));
						pb.setAvg_cost(rs.getDouble(4));
						pb.setO_place(rs.getString(5));
						pb.setS_life(rs.getInt(6));
						pb.setSuppier_id(rs.getString(7));
		
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
	}

