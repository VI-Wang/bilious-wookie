//��֤�û��Ƿ��¼
package com.vi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.vi.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginClServlet extends HttpServlet {

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
		String userName=(String)request.getParameter("userName");
		String password=(String)request.getParameter("password");
		String type=(String)request.getParameter("type");
		UserBeanBO ubb=new UserBeanBO();
		MyCartBO mbo=(MyCartBO)request.getSession(true).getAttribute("MyCart");
		if(mbo==null)
		{
			mbo=new MyCartBO();
			request.getSession(true).setAttribute("MyCart",mbo);
		}
		//�ѹ��ﳵ�Ļ���ȡ������׼������һ��ҳ����ʾ
		List<BooksBean> al=mbo.showMyCart();
		//���뵽request
		request.setAttribute("myCartInfo",al);
		
		//�õ��û���Ϣ
		
		if(type.equals("loginCheck"))
		{
			UserBean ub=(UserBean)request.getSession(true).getAttribute("userInfo");
			
			//�û�û��½��
			if(ub==null)
			{
				
				request.getRequestDispatcher("myCart2.jsp").forward(request, response);
				
			}else{
				//�û���½��
				
				String userName1=ub.getUserName();
				
				UserBean ub1=ubb.getUserInfoByUserName(userName1);
				request.setAttribute("userInfo", ub1);
				request.getRequestDispatcher("myCart3.jsp").forward(request, response);
				
			}
		}else if(type.equals("login"))
		{
			if(ubb.checkUser(userName,password))
			{
				//��֤�û��ǺϷ���
				UserBean ub=ubb.getUserInfoByUserName(userName);
				request.setAttribute("userInfo", ub);
				request.getRequestDispatcher("myCart3.jsp").forward(request, response);
			
			}else{
				//�û����Ϸ�
				request.getRequestDispatcher("myCart2.jsp").forward(request, response);
			}
		
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
