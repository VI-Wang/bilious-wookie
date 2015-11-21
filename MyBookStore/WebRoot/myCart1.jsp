<%@ page language="java" import="java.util.*,com.vi.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
MyCartBO mbo=(MyCartBO)session.getAttribute("MyCart");
List<BooksBean> al=(List<BooksBean>)request.getAttribute("myCartInfo");


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myCart1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="mycss/mycss.css">
	<script type="text/javascript">
	<!--
		function deleteBook(booksId)
		{
			window.open("ShoppingClServlet?type=deleteBooks&booksId="+booksId,"_self");
		}
		function deleteAll()
		{
			window.open("ShoppingClServlet?type=deleteAll","_self");
		}
		function loginCheck()
		{
			window.open("LoginClServlet?type=loginCheck","_self");
		}
		
	
	-->
	</script>

  </head>
  
  <body topmargin="0">
   <center>
   <table width="80%" border="0" align="center">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"></jsp:include></td>
  </tr>
  <tr>
    <td align="center"><form action="ShoppingClServlet?type=updateNum" method="post"><table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td colspan="6" align="center"><img src="images/head1.png" width="1054" height="65" /></td>
        </tr>
      <tr>
        <td width="12%" align="center" class="css10">编号</td>
        <td width="39%" align="center" class="css10">书名</td>
        <td width="24%" align="center" class="css10">单价</td>
        <td width="9%" align="center" class="css10">数量</td>
        <td width="9%" align="center" class="css10">&nbsp;</td>
        <td width="7%" align="center" class="css10">&nbsp;</td>
      </tr>
      <% for(int i=0;i<al.size();i++)
      	{
      		BooksBean bb=al.get(i);
      		
      		%><tr>
        	<td align="center" class="css2"><%=bb.getBooksId() %></td>
        	<td align="center" class="css2"><%=bb.getBooksName() %></td>
        	<td align="center" class="css2"><%=bb.getNewPrice() %></td>
        	<td align="center" class="css2"><input type="hidden" name="booksId" value="<%=bb.getBooksId() %>"><input name="newNum" type="text" size="10" value="<%=mbo.getNumById(bb.getBooksId()+"") %>"/></td>
        	<td align="center" class="css2"><input type="button" border="0" onclick="deleteBook(<%=bb.getBooksId() %>)" value="删除"/></td>
        	<td align="center" class="css2"><a href="ShowBooksClServlet?booksId=<%=bb.getBooksId() %>">查看</a></td>
      		</tr>
      	<%
      	}
      %>
      <tr>
        <td align="center">&nbsp;</td>
        <td align="right"><input name="Submit3" type="button" onclick="deleteAll()" class="button1" value="删除全部书籍" /></td>
        <td align="center"><input name="Submit22" type="submit" class="button3" value="修改书籍数量" /></td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" align="left" class="css2">您共选择了价值<%=mbo.getAllPrice() %>元的书籍，点击<a href="index.jsp">此处</a>继续购物。</td>
        <td colspan="3" align="right"><input name="Submit32" type="button" onclick="loginCheck()" class="button2" value="下一步" /></td>
        </tr>
    </table></form></td>
  </tr>
  <tr>
    <td align="center">
    <jsp:include page="tail.jsp"></jsp:include></td>
  </tr>
</table>
   </center>
  </body>
</html>
