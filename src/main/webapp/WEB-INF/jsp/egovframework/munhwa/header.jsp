<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<title>문화일기</title> 
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:800|Nanum+Myeongjo:800&display=swap"/>
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Song+Myung&display=swap" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sriracha&display=swap" rel="stylesheet"/>
<script type="text/javascript" src="https://kit.fontawesome.com/a076d05399.js"></script> 
<link type="text/css" rel="stylesheet" href="<c:url value='/css/header.css'/>"/>
   <div id="myHeader" style="width: 100%;">
      <a href="/"><span id="logo">문화일기</span></a>
      <div id="queryBox">
         <input id="query" type="text" maxlength="255"/>
         <i id="searchIcon" class="fas fa-search fa-2x"></i>
      </div>
      <div style="width: 1100px;height:40px;text-align: center;margin:0 auto;position: absolute;top:92px;left:70px;">
      	<div style="width: 100%;height:40px;margin: 0 auto;text-align: center;">
      		<ul>
      			<li id="music" class="menuBox"style="width: 210px;padding: 10px;list-style: none;float: left;"><a class="menu" style="text-decoration:none;">음악</a></li>
      			<li id="act"class="menuBox"style="width: 210px;padding: 10px;list-style: none;float: left;"><a class="menu" style="text-decoration:none;">연극</a></li>
      			<li id="dance"class="menuBox"style="width: 210px;padding: 10px;list-style: none;float: left;"><a class="menu" style="text-decoration:none;">무용</a></li>
      			<li id="art" class="menuBox"style="width: 210px;padding: 10px;list-style: none;float: left;"><a class="menu" style="text-decoration:none;">미술</a></li>
      			<li id="myCalendar" class="menuBox"style="width: 210px;padding: 10px;list-style: none;float: left;"><a class="menu" href="<%=request.getContextPath() %>/mycalendar/main.do" style="text-decoration:none;">마이캘린더</a></li>
      		</ul>
      	</div>
      </div>
   </div>
