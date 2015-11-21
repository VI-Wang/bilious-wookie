<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <style type="text/css"><!--BODY {FONT-SIZE: 12px;MARGIN:0 auto;COLOR: #000;font-family:Verdana, Geneva,sans-serif;text-align:left;clear:both;}ul { margin:1px -10px;padding:0px 10px;}li {list-style-type:none;}.Menubox {width:600px;height:28px;line-height:28px;margin:5px 0 10px 10px;}.Menubox ul{margin:0px;padding:0px;}.Menubox li{float:left;display:block;cursor:pointer;width:60px;text-align:center;color:#00f;text-decoration:underline;}.Menubox li.hover{padding:0px;background:#fff;width:65px;color:#666;font-weight:bold;height:27px;<br>line-height:27px;text-decoration: none;cursor:hand;}.Contentbox{clear:both;border-top:none;height:auto;padding:8px 0 0 10px;}--></style></head><script><!--/*xuanxiangka*/function setTab(name,cursel,n){for(i=1;i<=n;i++){var menu=document.getElementById(name+i);var con=document.getElementById("con_"+name+"_"+i);menu.className=i==cursel?"hover":"";con.style.display=i==cursel?"block":"none";}}//--></script><body><div class="Menubox"><ul><li id="one1" onmousemove="setTab('one',1,3)" class="hover">我的相册</li><li id="one2" onmousemove="setTab('one',2,3)">我的画廊</li><li id="one3" onmousemove="setTab('one',3,3)">主题画廊</li></ul></div><div class="Contentbox"><div id="con_one_1" class="hover">sdf</div><div id="con_one_2" style="display:none">sdfsdfsdfsd</div><div id="con_one_3" style="display:none">dsf</div> </div></body></html>
 