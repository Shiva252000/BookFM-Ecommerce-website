package com.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAO;
import com.dao.BookOrderDAO;
import com.db.DBConnect;
import com.model.BookDtls;
import com.model.Book_Order;
import com.model.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phone_no=req.getParameter("phone_no");
			String paymentType=req.getParameter("payment");
			
			
			CartDAO dao =new CartDAO(DBConnect.getConn());
	
			List<Cart> blist=dao.getBookByUser(id);
			
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add item(s) to the cart");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrderDAO dao2 = new BookOrderDAO(DBConnect.getConn());
				int i=dao2.getOrderNo();
				Book_Order o=null;
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order> ();
				
				for (Cart c:blist) 
				{
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00"+i);
					o.setName(name);
					o.setEmail(email);
					o.setPhone_no(phone_no);
					o.setBookName(c.getBookName());
					o.setNarrator(c.getNarrator());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
					
				}
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Please choose payment mode");
					resp.sendRedirect("checkout.jsp");
					
				}else {
					boolean f =dao2.saveOrder(orderList);
					
					if(f) {
						resp.sendRedirect("CardPayment.jsp");
					}else {
						session.setAttribute("failedMsg", "Your order gets failed");
						resp.sendRedirect("checkout.jsp");
					}
				}

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}