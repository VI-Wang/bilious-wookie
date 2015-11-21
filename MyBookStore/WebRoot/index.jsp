<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="mycss/mycss.css">
	<style type="text/css">a:link,a:visited{ text-decoration:none;color:#003366}a:hover{ text-decoration:underline;}</style>
  </head>
  
  <body topmargin="0">
    <center>
    <table width="80%" border="0">
  <tr>
    <td height="88" align="center" class="css1">
    <jsp:include page="head.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td height="440" align="center" class="css1">
    <jsp:include page="main.jsp"></jsp:include>
    </td>
  </tr>
  <tr>
    <td align="center" class="css1">
    <jsp:include page="tail.jsp"></jsp:include>
    </td>
  </tr>
</table>
    </center>
  </body>
</html>
