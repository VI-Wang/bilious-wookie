<%@ page language="java" import="java.util.*,com.vi.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
OrderBean ob=(OrderBean)request.getSession(true).getAttribute("OrderBean");
MyCartBO mbo=(MyCartBO)session.getAttribute("MyCart");
List<BooksBean> al=(List<BooksBean>)request.getAttribute("myCartInfo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myCart4.jsp' starting page</title>
    
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
    <td align="center"><table width="100%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="10"><img src="images/head4.png" width="1057" height="67" /></td>
        </tr>
      <tr>
        <td height="44" colspan="10" align="center" bgcolor="#FFFF00" class="css10">订单</td>
        </tr>
      <tr>
        <td width="8%" height="30" align="center" bgcolor="#FFFF00" class="css2">订单编号</td>
        <td width="6%" align="center" bgcolor="#FFFF00" class="css2">收货人</td>
        <td width="7%" align="center" bgcolor="#FFFF00" class="css2">收货地址</td>
        <td width="11%" align="center" bgcolor="#FFFF00" class="css2">邮编</td>
        <td width="7%" align="center" bgcolor="#FFFF00" class="css2">家庭电话</td>
        <td width="10%" align="center" bgcolor="#FFFF00" class="css2">手机号码</td>
        <td width="10%" align="center" bgcolor="#FFFF00" class="css2">用户名</td>
        <td width="14%" align="center" bgcolor="#FFFF00" class="css2">电子邮件</td>
        <td width="20%" align="center" bgcolor="#FFFF00" class="css2">总价</td>
        <td width="7%" align="center" bgcolor="#FFFF00" class="css2">&nbsp;</td>
      </tr>
      <tr>
        <td height="31" align="center" bgcolor="#FFFF00" class="css2"><%=ob.getOrderId() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getTrueName() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getAddress() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getPostCode() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getHomeNumber() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getPhoneNumber() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getUserName() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=ob.getEmail() %></td>
        <td align="center" bgcolor="#FFFF00" class="css2"><%=mbo.getAllPrice() %>元</td>
        <td align="center" bgcolor="#FFFF00" class="css2"><a href="OrderClServlet?type=showOrderDetail&orderId=<%=ob.getOrderId() %>&orderId=<%=ob.getOrderId() %>">查看详情</a></td>
      </tr>
      <tr>
        <td height="35" colspan="10" align="center" class="css2">尊敬的用户，您的订单已经完成。欢迎您下次光临。谢谢。</td>
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
