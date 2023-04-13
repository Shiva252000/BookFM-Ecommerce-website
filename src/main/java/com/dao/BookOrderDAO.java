package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Book_Order;

public class BookOrderDAO implements IBookOrderDAO {
	
	private Connection conn;
	
	
	public BookOrderDAO(Connection conn) {
		super();
		this.conn = conn;
	}


	public int getOrderNo() {
		int i=1;
		try {
			
			String sql="select * from orders";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}


	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try {
			
			String sql = "insert into orders(order_id,name,email,phone,book_name,narrator,price,payment) values(?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for(Book_Order b:blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getPhone_no());
				ps.setString(5, b.getBookName());
				ps.setString(6, b.getNarrator());
				ps.setString(7, b.getPrice());
				ps.setString(8, b.getPaymentType());
				ps.addBatch();
			}
			
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public List<Book_Order> getBook(String email) {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o=null;
		
		
		try {
			
			String sql = "select * from orders where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o=new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhone_no(rs.getString(5));
				o.setBookName(rs.getString(6));
				o.setNarrator(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				o.setAudio(rs.getString(10));
				list.add(o);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public List<Book_Order> getAllOrder() {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o=null;
		
		
		try {
			
			String sql = "select * from orders";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o=new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhone_no(rs.getString(5));
				o.setBookName(rs.getString(6));
				o.setNarrator(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentType(rs.getString(9));
				o.setAudio(rs.getString(10));
				list.add(o);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	
	
	
}