package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAO;
import com.db.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		CartDAO dao = new CartDAO(DBConnect.getConn());
		boolean f = dao.deleteBook(bid, uid);
		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Book Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("checkout.jsp");
		}

	}

}