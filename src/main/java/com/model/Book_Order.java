package com.model;

public class Book_Order {
	
	private int id;
	private String orderId;
	private String name;
	private String email;
	private String phone_no;
	private String bookName;
	private String narrator;
	private String price;
	private String paymentType;
	private String audio;
	
	public Book_Order() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getNarrator() {
		return narrator;
	}

	public void setNarrator(String narrator) {
		this.narrator = narrator;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	@Override
	public String toString() {
		return "Book_Order [id=" + id + ", orderId=" + orderId + ", name=" + name + ", email=" + email + ", phone_no="
				+ phone_no + ", bookName=" + bookName + ", narrator=" + narrator + ", price=" + price + ", paymentType="
				+ paymentType + ", audio=" + audio + "]";
	}
	
	
	
	
}