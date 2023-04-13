package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.model.BookDtls;

public class BookDAO implements IBookDAO {

	private Connection conn;

	public BookDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "insert into BookDtls(book_name,narrator,description,price,book_category,photo,email,audio) values(?,?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getNarrator());
			ps.setString(3, b.getDescription());
			ps.setDouble(4, b.getPrice());
			ps.setString(5, b.getBookCategory());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			ps.setString(8, b.getAudio());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getAllBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from  bookdtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public BookDtls getBookbyid(int Id) {
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean updateEditbooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "update bookdtls set  book_name=?,narrator=?,price=?,book_category=? where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getNarrator());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from bookdtls where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getNewBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_Category=? order by book_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getPopularBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_Category=? order by book_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Popular");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getVintageBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_Category=? order by book_Id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Vintage");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_category=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllPopularBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_category=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Popular");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getAllVintageBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_category=? order by book_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Vintage");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from bookdtls where book_name like ? or narrator like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setNarrator(rs.getString(3));
				b.setDescription(rs.getString(4));
				b.setPrice(rs.getDouble(5));
				b.setBookCategory(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				b.setAudio(rs.getString(9));
				list.add(b);
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}