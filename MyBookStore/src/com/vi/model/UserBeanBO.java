//这是对users表业务逻辑处理的类
package com.vi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserBeanBO {

	private ResultSet rs;
	private PreparedStatement ps;
	private Connection ct;
	
	//得到用户的详细信息
		public UserBean getUserInfoByUserId(String userId)
		{
			UserBean ub=new UserBean();
			try{
				ct=new ConnDB().getConnection();
				ps=ct.prepareStatement("select userId,userName,trueName,address,postCode,homeNumber,phoneNumber,email from users where userId=?");
				ps.setString(1,userId);
				rs=ps.executeQuery();
				if(rs.next())
				{
					ub.setUserId(rs.getInt(1));
					ub.setUserName(rs.getString(2));
					ub.setTrueName(rs.getString(3));
					ub.setAddress(rs.getString(4));
					ub.setPostCode(rs.getLong(5));
					ub.setHomeNumber(rs.getLong(6));
					ub.setPhoneNumber(rs.getLong(7));
					
					ub.setEmail(rs.getString(8));
				}
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}finally{
				this.close();
			}
			return ub;
		}
	
	//得到用户的详细信息
	public UserBean getUserInfoByUserName(String userName)
	{
		UserBean ub=new UserBean();
		try{
			ct=new ConnDB().getConnection();
			ps=ct.prepareStatement("select userId,userName,trueName,address,postCode,homeNumber,phoneNumber,email from users where userName=?");
			ps.setString(1,userName);
			rs=ps.executeQuery();
			if(rs.next())
			{
				ub.setUserId(rs.getInt(1));
				ub.setUserName(rs.getString(2));
				ub.setTrueName(rs.getString(3));
				ub.setAddress(rs.getString(4));
				ub.setPostCode(rs.getLong(5));
				ub.setHomeNumber(rs.getLong(6));
				ub.setPhoneNumber(rs.getLong(7));
				
				ub.setEmail(rs.getString(8));
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			this.close();
		}
		return ub;
	}
	//验证用户是否合法
	public boolean checkUser(String userName,String password)
	{
		boolean b=false;
		try{
			ct=new ConnDB().getConnection();
			ps=ct.prepareStatement("select password from users where userName=?");
			ps.setString(1,userName);
			rs=ps.executeQuery();
			if(rs.next())
			{
				String dbPassword=rs.getString(1);
				if(dbPassword.equals(password))
				{
					b=true;
				}
			}
			
		}catch(Exception e)
		{
			b=false;
			e.printStackTrace();
		}finally{
			this.close();
		}
		return b;
		
	}
	//关闭资源
		public void close()
		{
			try{
				if(rs!=null)
				{
					rs.close();
					rs=null;
				}
				if(ps!=null)
				{
					ps.close();
					ps=null;
				}
				if(ct!=null)
				{
					ct.close();
					ct=null;
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
}
