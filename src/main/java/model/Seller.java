package model;

public class Seller {
	
	private String sel_num;
	private	String id;
	private String pass;
	private String name;
	private String email;
	private String phone;
	private String type;
	private String zipcode;
	private String zipcode1;
	private String zipcode2;
	private String zipcode3;
	private String zipcode4;
	private String state;
	
	
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String getZipcode3() {
		return zipcode3;
	}
	public void setZipcode3(String zipcode3) {
		this.zipcode3 = zipcode3;
	}
	public String getZipcode4() {
		return zipcode4;
	}
	public void setZipcode4(String zipcode4) {
		this.zipcode4 = zipcode4;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSel_num() {
		return sel_num;
	}
	public void setSel_num(String sel_num) {
		this.sel_num = sel_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Seller [sel_num=" + sel_num + ", id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", type=" + type + ", zipcode=" + zipcode + ", zipcode1=" + zipcode1
				+ ", zipcode2=" + zipcode2 + ", zipcode3=" + zipcode3 + ", zipcode4=" + zipcode4 + ", state=" + state
				+ "]";
	}
	
	
	
}
