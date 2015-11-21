package com.vi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.vi.model.BooksBean;
import com.vi.model.MyCartBO;
import com.vi.model.UserBean;
import com.vi.model.UserBeanBO;

public class ShoppingClServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String type=request.getParameter("type");
		//拿到购物车
		MyCartBO mbo=(MyCartBO)request.getSession(true).getAttribute("MyCart");
		List<BooksBean> al=null;
		if(mbo==null)
		{
			mbo=new MyCartBO();
			request.getSession(true).setAttribute("MyCart",mbo);
		}
		try{
			if(type.equals("addCart"))
			{
				mbo.addCart(request.getParameter("booksId"), "1");
			}else if(type.equals("deleteBooks"))
			{
				mbo.deleteBooks(request.getParameter("booksId"));
			}else if(type.equals("deleteAll"))
			{
				mbo.clearCart();
			}else if(type.equals("updateNum"))
			{
				String booksId[]=request.getParameterValues("booksId");
				String newNum[]=request.getParameterValues("newNum");
				for(int i=0;i<booksId.length;i++)
				{
					mbo.updateBooksNum(booksId[i], newNum[i]);
				}
				
			}else if(type.equals("back"))
			{
				
				String userId=request.getParameter("userId");
				UserBean ub=new UserBeanBO().getUserInfoByUserId(userId);
				//放入session里
				request.getSession(true).setAttribute("userInfo", ub);
				al=mbo.showMyCart();
				request.setAttribute("myCartInfo",al);
				request.getRequestDispatcher("myCart1.jsp").forward(request, response);
				return;
				
			}
			
			
			//把购物车的货物取出来，准备在下一个页面显示
			al=mbo.showMyCart();
			//放入到request
			request.setAttribute("myCartInfo",al);
			request.getRequestDispatcher("myCart1.jsp").forward(request, response);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
