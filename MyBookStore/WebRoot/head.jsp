<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
<!--
	function returnToIndex()
	{
		window.open("index.jsp","_self");
	}
-->
</script>
  <table  width="100%" border="0" cellspacing="0">
  <tr>
    <td width="70%" height="92" colspan="6" bordercolor="#FFFFFF" class="css3"><span class="css5">I</span>nternet<span class="css5">B</span>ook<span class="css5">S</span>tore</td>
    <td width="15%" rowspan="2" align="center" bordercolor="#000000"><p class="css2">我的账号<img src="images/login.jpg" width="32" height="35" /></p>
    <p class="css4">登录到我的账号</p></td>
    <td width="15%" rowspan="2" align="center" bordercolor="#000000"><p><span class="css2">查看购物车</span><img src="images/cart.jpg" width="35" height="34" /></p>
    <p class="css4">查看购物车中的信息</p></td>
  </tr>
  <tr bordercolor="#FFFFFF">
    <td height="29" colspan="6"><span class="css2">网上图书商城，祝您购书愉快！</span></td>
  </tr>
  <tr>
    <td height="40" align="center" bordercolor="#000000" bgcolor="#003366" class="css7" onclick="returnToIndex()">首页</td>
    <td align="center" bordercolor="#000000" bgcolor="#003366" class="css7">计算机</td>
    <td align="center" bordercolor="#000000" bgcolor="#003366" class="css7">外语</td>
    <td align="center" bordercolor="#000000" bgcolor="#003366" class="css7">文学</td>
    <td align="center" bordercolor="#000000" bgcolor="#003366" class="css7">图书论坛</td>
    <td align="center" bordercolor="#000000" bgcolor="#003366" class="css7">关于我们</td>
    <td colspan="3" align="right" bordercolor="#000000" bgcolor="#003366" class="css7"><input name="textfield2" type="text" class="css2" value="请输入关键词" />
    &nbsp;&nbsp;
      <input name="Submit2" type="submit" class="css1" value="搜索" />&nbsp;&nbsp;</td>
  </tr>
</table>
