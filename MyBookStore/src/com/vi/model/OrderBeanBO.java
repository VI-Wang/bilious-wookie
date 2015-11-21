package com.vi.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class OrderBeanBO 
{
	private ResultSet rs;
	private PreparedStatement ps;
	private Connection ct;
	
	public List<OrderBean> showOrder(String orderId)
	{
		
		List<OrderBean> orderList=new ArrayList<OrderBean>();
		try{
			ct=new ConnDB().getConnection();
			ps=ct.prepareStatement("select orderDetail.booksId,booksName,ISBN,newPrice,orderDetail.num,orderId from orderDetail,books where orderDetail.booksId=books.booksId and orderId="+orderId);
			rs=ps.executeQuery();
			while(rs.next())
			{
				OrderBean ob=new OrderBean();
				ob.setBooksId(rs.getInt(1));
				ob.setBooksName(rs.getString(2));
				ob.setISBN(rs.getLong(3));
				ob.setNewPrice(rs.getFloat(4));
				ob.setNum(rs.getInt(5));
				ob.setOrderId(rs.getInt(6));
				orderList.add(ob);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			this.close();
		}
		return orderList;
	}
	
	public OrderBean addOrderBean(MyCartBO mbo,String userId)
	{
		OrderBean ob=new OrderBean();
		try{
			//先处理orders表
			ct=new ConnDB().getConnection();
			
			float totalPrice=mbo.getAllPrice();
			
			String sql="insert into orders(userId,orderDate,totalPrice) values("+userId+",now(),"+totalPrice+")";
			ps=ct.prepareStatement(sql);
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				//添加订单成功
				//处理ordersDetail表
				List<BooksBean> al=(List<BooksBean>)mbo.showMyCart();
				String sql2="select orderId from orders order by orderId desc limit 1";
				ps=ct.prepareStatement(sql2);
				rs=ps.executeQuery();
				int orderId=0;
				if(rs.next())
				{
					orderId=rs.getInt(1);
				}
				System.out.println(orderId+"orderNea");
				Statement sm=ct.createStatement();
				for(int k=0;k<al.size();k++)
				{
					BooksBean bb=al.get(k);
					String sql1="insert into orderDetail(orderId,booksId,num) values("+orderId+","+bb.getBooksId()+","+mbo.getNumById(bb.getBooksId()+"")+")";
					sm.addBatch(sql1);
				}
				sm.executeBatch();
				
				//封装到ob里
				String sql3="select orderId,trueName,address,postCode,homeNumber,phoneNumber,userName,email,orderDate,users.userId from users,orders where users.userId=(select userId from orders order by orderId desc limit 1) and orderId=(select orderId from orders order by orderId desc limit 1)";
				ps=ct.prepareStatement(sql3);
				rs=ps.executeQuery();
				if(rs.next())
				{
					ob.setOrderId(rs.getInt(1));
					ob.setTrueName(rs.getString(2));
					ob.setAddress(rs.getString(3));
					ob.setPostCode(rs.getLong(4));
					ob.setHomeNumber(rs.getLong(5));
					ob.setPhoneNumber(rs.getLong(6));
					ob.setUserName(rs.getString(7));
					ob.setEmail(rs.getString(8));
					ob.setOrderDate(rs.getDate(9));
					ob.setUserId(rs.getInt(10));
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			this.close();
		}
		
		return ob;
	}
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
