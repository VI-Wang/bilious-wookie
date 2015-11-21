<%@ page language="java" import="java.util.*,com.vi.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
BooksBeanBO bbb=new BooksBeanBO();
int pageNow=1;
int pageSize=6;
java.text.DecimalFormat df=new java.text.DecimalFormat("#.00");  
List<BooksBean> bblist=bbb.getBooksByPage(pageNow, pageSize);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<table width="100%" border="0" cellspacing="10" cellpadding="10">
<%  
	int time=0;
	for(int i=0;i<2;i++)
	{
		%>
		<tr>
		<% 
		for(int k=0;k<3;k++)
		{
			BooksBean bb=bblist.get(time);
			%>
			<td width="32%" height="205"><table width="100%" border="0">
      <tr>
        <td width="40%" height="126"><img src="images/<%=bb.getPicture() %>" width="150" height="150" /></td>
        <td width="60%" class="price"><p class="price"><span class="title"><a href="ShowBooksClServlet?booksId=<%=bb.getBooksId() %>"><%=bb.getBooksName() %></a></span></p>
          <p class="price">¥<%=bb.getNewPrice() %></p>
          <p class="css2 STYLE1"><span class="css4">定价：</span><span class="originalprice">¥<%=bb.getOriginPrice() %></span> <span class="css4">(<%=df.format(bb.getNewPrice()*10/bb.getOriginPrice()) %>折)</span></p>
          </td>
      </tr>
      
      <tr>
        <td height="29" align="right"><input name="Submit" type="submit" class="button1" value="一键购买" />&nbsp;&nbsp;</td>
        <td align="left"><input name="Submit2" type="submit" class="button2" value="加入购物车" /></td>
      </tr>
    </table></td>
			<%
			if(time<5)
			{
				time++;
			}
		} %>
	</tr>
	<%
	}
  	%>
  
</table>