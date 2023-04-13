package com.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.model.User;
import com.user.hashing.HashCode;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phone_no = req.getParameter("phone_no");
			String password = req.getParameter("password");
			password = HashCode.getMd5(password);

			User us = new User();
			us.setUser_id(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhone_no(phone_no);

			HttpSession session = req.getSession();
			UserDAO dao = new UserDAO(DBConnect.getConn());

			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("succMsg", "Profile Updated Successfully");
					resp.sendRedirect("edit_profile.jsp");

				} else {
					session.setAttribute("failedMsg", "Something wrong on server");
					resp.sendRedirect("edit_profile.jsp");
				}

			} else {
				session.setAttribute("failedMsg", "Your Password is Incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}