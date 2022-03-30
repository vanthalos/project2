package model;

public class OrderList {
	private String seller_id;
	private String orderNumber;
	private String signDate;
	private String productInfo;
	private String buyerName;
	private String buyerPhone;
	private String buyerAddress;
	private String buyerPaymentInfo;
	private String PaymentCheck;
	private int numbering;
	private int productAmount;
	private int productPrice;
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getSignDate() {
		return signDate;
	}
	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getBuyerPhone() {
		return buyerPhone;
	}
	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}
	public String getBuyerAddress() {
		return buyerAddress;
	}
	public void setBuyerAddress(String buyerAddress) {
		this.buyerAddress = buyerAddress;
	}
	public String getBuyerPaymentInfo() {
		return buyerPaymentInfo;
	}
	public void setBuyerPaymentInfo(String buyerPaymentInfo) {
		this.buyerPaymentInfo = buyerPaymentInfo;
	}
	public String getPaymentCheck() {
		return PaymentCheck;
	}
	public void setPaymentCheck(String paymentCheck) {
		PaymentCheck = paymentCheck;
	}
	public int getNumbering() {
		return numbering;
	}
	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	@Override
	public String toString() {
		return "OrderList [seller_id=" + seller_id + ", orderNumber=" + orderNumber + ", signDate=" + signDate
				+ ", productInfo=" + productInfo + ", buyerName=" + buyerName + ", buyerPhone=" + buyerPhone
				+ ", buyerAddress=" + buyerAddress + ", buyerPaymentInfo=" + buyerPaymentInfo + ", PaymentCheck="
				+ PaymentCheck + ", numbering=" + numbering + ", productAmount=" + productAmount + ", productPrice="
				+ productPrice + "]";
	}
	
	
	

	
	
	
	
	
}
