<%@ page language="java" import="java.util.*,com.vi.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<OrderBean> al=(List<OrderBean>)request.getSession(true).getAttribute("showOrderDetail");

OrderBean ob1=(OrderBean)request.getSession(true).getAttribute("OrderBean");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myCart5.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="mycss/mycss.css">
	

  </head>
  
  <body topmargin="0">
  <center>
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="50%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="6">&nbsp;</td>
        </tr>
      <tr>
        <td height="44" colspan="6" align="center" bgcolor="#FFFF00" class="css10">订单详情 （下单时间：<%=ob1.getOrderDate() %>，订单编号：<%=ob1.getOrderId() %>） </td>
        </tr>
      <tr>
        <td width="19%" height="30" align="center" bgcolor="#FFFF00" class="css2">书籍编号</td>
        <td width="27%" align="center" bgcolor="#FFFF00" class="css2">书名</td>
        <td width="19%" align="center" bgcolor="#FFFF00" class="css2">ISBN</td>
        <td width="15%" align="center" bgcolor="#FFFF00" class="css2">单价</td>
        <td width="20%" align="center" bgcolor="#FFFF00" class="css2">数量</td>
        
      </tr>
      <% 
      	for(int i=0;i<al.size();i++)
      	{
      		OrderBean ob=al.get(i);
      	%>
      	<tr>
        <td height="31" align="center" bgcolor="#FFFF00" class="css2"><%=ob.getBooksId() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getBooksName() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getISBN() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getNewPrice() %>元</td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getNum() %></td>
        </tr>
      	<% 
      	}
      
      %>
      <tr>
        <td height="35" colspan="6" align="center" class="css2"><a href="myCart4.jsp">返回上一页</a></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center">
    <jsp:include page="tail.jsp"></jsp:include>
    </td>
  </tr>
</table>
  </center>
    
  </body>
</html>
