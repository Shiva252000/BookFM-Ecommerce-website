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
import com.model.BookDtls;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, NumberFormatException {

		try {

			int Id = Integer.parseInt(req.getParameter("id"));

			String bookName = req.getParameter("bname");
			String narrator = req.getParameter("narrator");
			String description = req.getParameter("description");
			Double price = Double.parseDouble(req.getParameter("price"));
			String categories = req.getParameter("categories");

			BookDtls b = new BookDtls();

			b.setBookId(Id);
			b.setBookName(bookName);
			b.setNarrator(narrator);
			b.setDescription(description);
			b.setPrice(price);
			b.setBookCategory(categories);

			BookDAO dao = new BookDAO(DBConnect.getConn());
			boolean f = dao.updateEditbooks(b);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg ", "Book update Succesfull");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg ", "Something wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}

}