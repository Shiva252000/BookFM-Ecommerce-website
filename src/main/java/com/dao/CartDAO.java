package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Cart;

public class CartDAO implements ICartDAO {

	private Connection conn;

	public CartDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "insert into cart(book_id,user_id,book_name,narrator,price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBook_id());
			ps.setInt(2, c.getUser_id());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getNarrator());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal_price());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {

			String sql = "select * from cart where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				c = new Cart();
				c.setCart_id(rs.getInt(1));
				c.setBook_id(rs.getInt(2));
				c.setUser_id(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setNarrator(rs.getString(5));
				c.setPrice(rs.getDouble(6));

				totalPrice = totalPrice + rs.getDouble(7);
				c.setTotal_price(totalPrice);

				list.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int bid, int uid) {

		boolean f = false;

		try {
			String sql = "delete from cart where book_id=? and user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

}
