package model;

public class ProductManagement {
	private int uid;
	private String p_name;
	private String company;
	private int price;
	private int amount;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "ProductManagement [uid=" + uid + ", p_name=" + p_name + ", company=" + company + ", price=" + price
				+ ", amount=" + amount + "]";
	}
	
	
}
