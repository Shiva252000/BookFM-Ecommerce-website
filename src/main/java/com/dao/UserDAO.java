package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;
import com.user.hashing.HashCode;

public class UserDAO implements IUserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;

		try {
			String sql = "insert into users(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone_no());
			ps.setString(4, HashCode.getMd5(us.getPassword()));

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public User login(String email, String password) {
		User us = null;
		try {
			String sql = "select * from users where email= ? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, HashCode.getMd5(password));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				us = new User();
				us.setUser_id(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone_no(rs.getString(4));
				us.setPassword(rs.getString(5));
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return us;

	}

	public boolean checkPassword(int id, String ps) {

		boolean f = false;
		try {
			String sql = "select * from users where user_id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean updateProfile(User us) {
		boolean f = false;

		try {
			String sql = "update users set name=?,email=?,phone=? where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone_no());
			ps.setInt(4, us.getUser_id());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean checkUser(String em) {
		boolean f = true;
		try {
			String sql = "select * from users where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				f=false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
