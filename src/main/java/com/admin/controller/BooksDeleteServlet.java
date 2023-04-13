package com.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookDAO;
import com.db.DBConnect;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("Id"));
			BookDAO dao = new BookDAO(DBConnect.getConn());
			boolean f = dao.deleteBooks(id);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg ", "Book delete Succesfull");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg ", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}