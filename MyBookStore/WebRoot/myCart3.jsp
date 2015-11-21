<%@ page language="java" import="java.util.*,com.vi.model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserBean ub=(UserBean)request.getAttribute("userInfo");
MyCartBO mbo=(MyCartBO)session.getAttribute("MyCart");
List<BooksBean> al=(List<BooksBean>)request.getAttribute("myCartInfo");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myCart3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="mycss/mycss.css">
	<script type="text/javascript">
	<!--
		function backToMyCart(userId)
		{
			window.open("ShoppingClServlet?type=back&userId="+userId,"_self");
		}
	
	-->
	</script>

  </head>
  
  <body topmargin="0">
    <center>
    <form action="OrderClServlet?type=finishOrder&userId=<%=ub.getUserId() %>" method="post">
    <table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><img src="images/head3.png" width="1056" height="66" /></td>
      </tr>
      <tr>
        <td height="208" align="center" valign="top"><table width="30%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" colspan="2" align="center" bgcolor="#FFFF00" class="css10">用户个人信息</td>
            </tr>
          <tr>
            <td height="28" align="right" bgcolor="#FFFF00">用户名：</td>
            <td bgcolor="#FFFF00"><input type="text" name="userName" value="<%=ub.getUserName() %>"/></td>
          </tr>
          <tr>
            <td height="27" align="right" bgcolor="#FFFF00">真实姓名：</td>
            <td bgcolor="#FFFF00"><input type="text" name="trueName" value="<%=ub.getTrueName() %>"/></td>
          </tr>
          <tr>
            <td height="23" align="right" bgcolor="#FFFF00">家庭住址：</td>
            <td bgcolor="#FFFF00"><input type="text" name="address" value="<%=ub.getAddress() %>"/></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#FFFF00">邮编：</td>
            <td bgcolor="#FFFF00"><input type="text" name="postCode" value="<%=ub.getPostCode() %>"/></td>
          </tr>
          <tr>
            <td height="26" align="right" bgcolor="#FFFF00">联系电话：</td>
            <td bgcolor="#FFFF00"><input type="text" name="phoneNumber" value="<%=ub.getPhoneNumber() %>"/></td>
          </tr>
          <tr>
            <td height="25" align="right" bgcolor="#FFFF00">电子邮件：</td>
            <td bgcolor="#FFFF00"><input type="text" name="email" value="<%=ub.getEmail() %>"/></td>
          </tr>
          <tr>
            <td height="24" align="right" bgcolor="#FFFF00">付款方式：</td>
            <td bgcolor="#FFFF00"><label>
              <input type="radio" name="payMode" value="radiobutton" />
              货到付款 
              <input type="radio" name="payMode" value="radiobutton" />
              微信支付            </label></td>
          </tr>
          <tr>
            <td height="24" colspan="2" align="center" bgcolor="#FFFF00"><input name="Submit" type="button" class="button3" value="修改个人信息" /></td>
        
            </tr>
        </table> 
          <table width="50%" border="1" cellspacing="0" cellpadding="0">
            <tr>
              <td height="26" colspan="4" align="center" bgcolor="#00FF00" class="css10">订单信息</td>
              </tr>
            <tr>
              <td height="25" align="center" bgcolor="#00FF00">编号</td>
              <td align="center" bgcolor="#00FF00">书名</td>
              <td align="center" bgcolor="#00FF00">单价</td>
              <td align="center" bgcolor="#00FF00">数量</td>
            </tr>
            <%
            for(int i=0;i<al.size();i++)
            {
            	BooksBean bb=al.get(i);
            	
            	%>
            	<tr>
              <td height="27" align="center" bgcolor="#00FF00"><%=bb.getBooksId() %></td>
              <td align="center" bgcolor="#00FF00"><%=bb.getBooksName() %></td>
              <td align="center" bgcolor="#00FF00"><%=bb.getNewPrice() %></td>
              <td align="center" bgcolor="#00FF00"><%=mbo.getNumById(bb.getBooksId()+"") %></td>
            </tr>
            	
            	<%
            }
             %>
            
            <tr>
              <td height="28" colspan="4" align="center" bgcolor="#00FF00">您共选择了价值<%=mbo.getAllPrice() %>元的书籍。</td>
              </tr>
            <tr>
              <td height="29" colspan="4" align="center" bgcolor="#00FF00"><input type="button" onclick="backToMyCart(<%=ub.getUserId() %>)" class="button3" value="返回修改购物车" /></td>
            </tr>
            <tr>
              <td height="29" colspan="4" align="center" bgcolor="#FFFF00">亲爱的用户，核实订单与个人信息无误后，点
                <input name="Submit3" type="submit" class="button2" value="确认" />
                进行下一步的操作。</td>
              </tr>
          </table>
          <p>&nbsp;</p></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center"><jsp:include page="tail.jsp"></jsp:include></td>
  </tr>
</table>
</form>
    </center>
  </body>
</html>
