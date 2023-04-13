package com.dao;

import java.util.List;

import com.model.Book_Order;

public interface IBookOrderDAO {
	
	public int getOrderNo();
	
	public boolean saveOrder(List<Book_Order> b);
	
	public List<Book_Order> getBook(String email);
	
	public List<Book_Order> getAllOrder();

}