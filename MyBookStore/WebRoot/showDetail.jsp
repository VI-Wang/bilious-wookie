<%@ page language="java" import="java.util.*,com.vi.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
BooksBean bb=(BooksBean)request.getAttribute("booksDetail");
java.text.DecimalFormat df=new java.text.DecimalFormat("#.00");  

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="mycss/mycss.css">
	<script type="text/javascript">
	<!--
		function addCart(booksId)
		{
			window.open("ShoppingClServlet?type=addCart&booksId="+booksId,"_self");
		}
	
	-->
	</script>

  </head>
  
  <body>
    <center>
    <table width="80%" border="0">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td height="270" align="center"><table width="100%" height="270" border="0">
      <tr>
        <td width="19%" colspan="2" rowspan="8" align="center"><img src="images/<%=bb.getPicture() %>" width="250" height="250" /></td>
        <td width="62%" class="title"><%=bb.getBooksName() %></td>
      </tr>
      <tr>
        <td>价格：<span class="price">¥<%=bb.getNewPrice() %></span></td>
      </tr>
      <tr>
        <td><span class="css4">原价：</span><span class="originalprice">¥<%=bb.getOriginPrice() %></span><span class="css4">（<%=df.format(bb.getNewPrice()*10/bb.getOriginPrice()) %>折）</span></td>
      </tr>
      <br>
      <tr>
        <br><td><span class="css2">ISBN:<%=bb.getISBN() %></span></td>
      </tr>
      <tr>
        <td><span class="css2">类型：<%=bb.getType() %></span></td>
      </tr>
       <tr>
        <td><span class="css2">出版商：<%=bb.getPublisher() %></span></td>
      </tr>
      <tr>
        <td height="94"><span class="css2">内容推荐：<%=bb.getBriefIntroduction() %></span></td>
      </tr>
      <tr>
        <td height="23" align="right"><input name="Collect" type="submit" class="button1" value="收藏到我的书单" />
          <input name="addCart" onclick="addCart(<%=bb.getBooksId() %>)" type="submit" class="button2" value="加入购物车" />
          <input name="BuyNow" type="submit" class="button3" value="一键购买" /></td>
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
