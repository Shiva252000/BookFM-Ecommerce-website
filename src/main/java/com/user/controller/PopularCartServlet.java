package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAO;
import com.dao.CartDAO;
import com.db.DBConnect;
import com.model.BookDtls;
import com.model.Cart;

@WebServlet("/popular_cart")
public class PopularCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			BookDAO dao = new BookDAO(DBConnect.getConn());
			BookDtls b = dao.getBookbyid(bid);

			Cart c = new Cart();
			c.setBook_id(bid);
			c.setUser_id(uid);
			c.setBookName(b.getBookName());
			c.setNarrator(b.getNarrator());
			c.setPrice(b.getPrice());
			c.setTotal_price(b.getPrice());

			CartDAO dao2 = new CartDAO(DBConnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Book added to cart");
				resp.sendRedirect("all_popular_book.jsp");

			} else {

				session.setAttribute("failed", "Something wrong on Server");
				resp.sendRedirect("all_popular_book.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
