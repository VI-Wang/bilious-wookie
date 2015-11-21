//���ﳵ
//��������û���Ҫ�������Ʒ
package com.vi.model;
import java.sql.*;
import java.util.*;
public class MyCartBO 
{
	private ResultSet rs;
	private PreparedStatement ps;
	private Connection ct;
	private float allPrice=0.0f;
	
	
	//�������hashmap
	HashMap<String,String> hm=new HashMap<String,String>();
	//�����鼮id�õ��鼮����
	public String getNumById(String booksId)
	{
		String newNum=hm.get(booksId);
		return newNum;
	}
	//�õ��ܼ�
	public float getAllPrice()
	{
		return this.allPrice;
	}
	
	//1.��ӻ���
	public void addCart(String booksId,String booksNum)
	{
		hm.put(booksId,booksNum);
	}
	//2.�޸Ļ���
	public void updateBooksNum(String booksId,String booksNewNum)
	{
		hm.put(booksId, booksNewNum);
	}
	//3.��չ��ﳵ
	public void clearCart()
	{
		hm.clear();
	}
	//4.ɾ��ĳ����
	public void deleteBooks(String booksId)
	{
		hm.remove(booksId);
	}
	//5.��ʾ���ﳵ
	public List<BooksBean> showMyCart()
	{
		
		List<BooksBean> al=new ArrayList<BooksBean>();
		try{
			//��hm�Ķ���ȡ������������
			Iterator it=hm.keySet().iterator();
			String sub="(";
			while(it.hasNext())
			{
				String booksId=(String)it.next();
				
				sub=sub+booksId;
				if(it.hasNext())
				{
					sub=sub+",";
				}
			}
			sub+=")";
			String sql="select booksId,booksName,newPrice,num from books where booksId in"+sub;
			if(sub.equals("()"))
			{
				sql="select booksId,booksName,newPrice,num from books where booksId=0";
				this.allPrice=0.0f;
			}
			ct=new ConnDB().getConnection();
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			this.allPrice=0.0f;
			while(rs.next())
			{
				BooksBean bb=new BooksBean();
				bb.setBooksId(rs.getInt(1));
				bb.setBooksName(rs.getString(2));
				float price=rs.getFloat(3);
				bb.setNewPrice(price);
				int num=rs.getInt(4);
				bb.setNum(num);
				this.allPrice=price*Integer.parseInt(this.getNumById(rs.getInt(1)+""))+this.allPrice;
				al.add(bb);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	//�ر���Դ
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
