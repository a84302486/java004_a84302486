package _01_ProductTest;

import java.sql.Blob;

public class ProductBean {
	private String productId;
	private int pgPrice;
	private String name;
	private double avgCost;
	private String oplace;
	private int slife;
	private String suppierId;
	private String  fileName;
	private Blob  coverImage;
	
	public ProductBean() {
	}
	
	public ProductBean(String productId, int pgPrice, String name, double avgCost, String oplace, int slife,
			String suppierId) {
		super();
		this.productId = productId;
		this.pgPrice = pgPrice;
		this.name = name;
		this.avgCost = avgCost;
		this.oplace = oplace;
		this.slife = slife;
		this.suppierId = suppierId;
	}
	
	public ProductBean(String productId, int pgPrice, String name, double avgCost, String oplace, int slife,
			String suppierId, String fileName) {
		super();
		this.productId = productId;
		this.pgPrice = pgPrice;
		this.name = name;
		this.avgCost = avgCost;
		this.oplace = oplace;
		this.slife = slife;
		this.suppierId = suppierId;
		this.fileName = fileName;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getPgPrice() {
		return pgPrice;
	}

	public void setPgPrice(int pgPrice) {
		this.pgPrice = pgPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getAvgCost() {
		return avgCost;
	}

	public void setAvgCost(double avgCost) {
		this.avgCost = avgCost;
	}

	public String getOplace() {
		return oplace;
	}

	public void setOplace(String oplace) {
		this.oplace = oplace;
	}

	public int getSlife() {
		return slife;
	}

	public void setSlife(int slife) {
		this.slife = slife;
	}

	public String getSuppierId() {
		return suppierId;
	}

	public void setSuppierId(String suppierId) {
		this.suppierId = suppierId;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public Blob getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(Blob productImage) {
		this.coverImage = productImage;
	}
	
}