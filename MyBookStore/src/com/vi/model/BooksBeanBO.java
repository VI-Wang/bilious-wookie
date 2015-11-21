//对books表的业务逻辑
package com.vi.model;
import java.sql.*;
import java.util.*;
public class BooksBeanBO {
	//定义一些变量
	private ResultSet rs;
	private PreparedStatement ps;
	private Connection ct;
	//在showDetail显示书籍详细信息
	public BooksBean showDetail(int booksId)
	{
		BooksBean bb=new BooksBean();
		try{
			ct=new ConnDB().getConnection();
			ps=ct.prepareStatement("select booksName,briefIntroduction,picture,newPrice,originPrice,type,ISBN,publisher from books where booksId=?");
			ps.setString(1, booksId+"");
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				bb.setBooksId(booksId);
				bb.setBooksName(rs.getString(1));
				bb.setBriefIntroduction(rs.getString(2));
				bb.setPicture(rs.getString(3));
				bb.setNewPrice(rs.getFloat(4));
				bb.setOriginPrice(rs.getFloat(5));
				bb.setType(rs.getString(6));
				bb.setISBN(rs.getLong(7));
				bb.setPublisher(rs.getString(8));
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			this.close();
		}
		return bb;
	}
	
	//在主页显示所有书籍的信息
	public List<BooksBean> getBooksByPage(int pageNow,int pageSize)
	{
		List<BooksBean> bblist=new ArrayList<BooksBean>();
		try{
			ct=new ConnDB().getConnection();
			ps=ct.prepareStatement("select booksId,booksName,briefIntroduction,picture,newPrice,originPrice from books limit "+(pageNow-1)*pageSize+","+pageSize);
			rs=ps.executeQuery();
			while(rs.next())
			{
				BooksBean bb=new BooksBean();
				bb.setBooksId(rs.getInt(1));
				bb.setBooksName(rs.getString(2));
				bb.setBriefIntroduction(rs.getString(3));
				bb.setPicture(rs.getString(4));
				bb.setNewPrice(rs.getFloat(5));
				bb.setOriginPrice(rs.getFloat(6));
				
				bblist.add(bb);
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return bblist;
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
