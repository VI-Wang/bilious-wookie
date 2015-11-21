package com.vi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vi.model.*;

public class OrderClServlet extends HttpServlet {

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
		OrderBeanBO obb=new OrderBeanBO();
		//得到购物车
		MyCartBO mbo=(MyCartBO)request.getSession(true).getAttribute("MyCart");
		
		
		if(request.getParameter("type").equals("finishOrder"))
		{
			//用户id
			String userId=request.getParameter("userId");
			OrderBean ob=obb.addOrderBean(mbo, userId);
			if(ob!=null)
			{
				System.out.println(ob.getOrderId()+"orderIdorderClServlet");
				request.getSession(true).setAttribute("OrderBean", ob);
				//添加成功
				request.getRequestDispatcher("myCart4.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("myCart3.jsp").forward(request, response);
			}
		}else if(request.getParameter("type").equals("showOrderDetail"))
		{
			List<OrderBean> al=obb.showOrder(request.getParameter("orderId"));
			System.out.println(request.getParameter("orderId")+"orderclservlet");
			request.getSession(true).setAttribute("showOrderDetail", al);
			//添加成功
			request.getRequestDispatcher("myCart5.jsp").forward(request, response);
			
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
