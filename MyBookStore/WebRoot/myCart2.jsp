<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myCart2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="mycss/mycss.css">
	

  </head>
  
  <body topmargin="0">
    <center>
    <table width="80%" border="0" align="center">
  <tr>
    <td align="center">
    <jsp:include page="head.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2" align="center"><img src="images/head2.png" width="1054" height="65" /></td>
        </tr>
      <tr>
        <td width="39%" height="222" align="center" valign="top" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <form action="LoginClServlet?type=login" method="post">
          <table width="69%" height="107" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2" align="center" bgcolor="#FFFF00" class="css10">老用户登录</td>
              </tr>
            <tr>
              <td width="37%" align="right" bgcolor="#FFFF00">用户名：</td>
              <td width="63%" bgcolor="#FFFF00"><input type="text" name="userName"/></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFF00">密码：</td>
              <td bgcolor="#FFFF00"><input type="password" name="password" /></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFF00"><input name="Submit" type="reset" class="button3" value="清除" /></td>
              <td align="center" bgcolor="#FFFF00"><input name="Submit2" type="submit" class="button2" value="登录" /></td>
            </tr>
          </table></form></td>
        <td width="61%" align="center" ><table width="74%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="36" colspan="4" align="center" bgcolor="#FFFF00" class="css10">新用户注册</td>
            </tr>
          <tr>
            <td width="21%" height="32" align="right" bgcolor="#FFFF00">用户名：</td>
            <td width="29%" bgcolor="#FFFF00"><input name="textfield3" type="text" size="15" /></td>
            <td width="17%" align="right" bgcolor="#FFFF00">真实姓名：</td>
            <td width="33%" bgcolor="#FFFF00"><input name="textfield35" type="text" size="15" /></td>
          </tr>
          <tr>
            <td height="35" align="right" bgcolor="#FFFF00">密码：</td>
            <td bgcolor="#FFFF00"><input name="textfield32" type="password" size="15" /></td>
            <td align="right" bgcolor="#FFFF00">家庭住址：</td>
            <td bgcolor="#FFFF00"><input name="textfield36" type="text" size="15" /></td>
          </tr>
          <tr>
            <td height="35" align="right" bgcolor="#FFFF00">手机：</td>
            <td bgcolor="#FFFF00"><input name="textfield33" type="text" size="15" /></td>
            <td align="right" bgcolor="#FFFF00">家庭电话：</td>
            <td bgcolor="#FFFF00"><input name="textfield37" type="text" size="15" /></td>
          </tr>
          <tr>
            <td height="30" align="right" bgcolor="#FFFF00">邮编：</td>
            <td bgcolor="#FFFF00"><input name="textfield34" type="text" size="15" /></td>
            <td align="right" bgcolor="#FFFF00">常用邮箱：</td>
            <td bgcolor="#FFFF00"><input name="textfield38" type="text" size="15" /></td>
          </tr>
          <tr>
            <td height="32" align="right" bgcolor="#FFFF00">&nbsp;</td>
            <td bgcolor="#FFFF00">&nbsp;</td>
            <td align="left" bgcolor="#FFFF00"><input name="Submit3" type="reset" class="button3" value="清除重填" /></td>
            <td bgcolor="#FFFF00"><input name="Submit22" type="submit" class="button2" value="一键注册" /></td>
          </tr>
        </table></td>
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
