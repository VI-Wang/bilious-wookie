//连接数据库的类
package com.vi.model;
import java.sql.*;
public class ConnDB {
	private Connection ct=null;
	private String url="jdbc:mysql://127.0.0.1:3306/bookstore?useUnicode=true&characterEncoding=utf-8";
	private String user="root";
	private String password="password";
	public Connection getConnection()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection(url,user,password);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return ct;
	}
}
