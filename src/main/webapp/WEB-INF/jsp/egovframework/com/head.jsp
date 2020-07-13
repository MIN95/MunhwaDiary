<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.util.EgovUserDetailsHelper" %>
<script language="text/javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<script type="text/javascript" src="https://kit.fontawesome.com/a076d05399.js"></script> 
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:800|Nanum+Myeongjo:800&display=swap"/>
<link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sriracha&display=swap" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/main_portal.css' />">
<script type="text/javascript">
	function fn_main_headPageMove(menuNo, url){
		document.selectOne.menuNo.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mnu/mpm/EgovMainMenuIndex.do'/>";
	    document.selectOne.submit();
	}

	function actionLogout()
	{
		document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
		document.selectOne.submit();
		//top.document.location.href = "<c:url value='/j_spring_security_logout'/>";
	}
</script>

<form name="selectOne">
<input name="menuNo" type="hidden" />
<input name="chkURL" type="hidden" />
    <div id="gnb">
    <div id="top_logo"><a href="<c:url value='/' />" target=_top><img style="width: 210px;height: 75px;" src="<c:url value='/images/munhwa/logo.png' />" alt="egovframe" /></a></div>
    <div id="use_descri">
    	<c:choose>
    		<c:when test="${empty sessionScope.loginVO.name }">
	            <ul>
	                <li><a href="/uat/uia/egovLoginUsr.do"><img style="width:50px;height: 25px;border: solid thin #ddd;" src="<c:url value='/images/egovframework/com/cmm/main/login.png' />" alt="로그인" /></a></li>
	            </ul>
    		</c:when>
	    	<c:otherwise>
	            <ul>
	                <li><c:out value="${sessionScope.loginVO.name }님 환영합니다" /></li>
	                <li><a href="/uat/uia/actionLogout.do"><img style="width:50px;height: 25px;border: solid thin #ddd;" src="<c:url value='/images/egovframework/com/cmm/main/logout.png' />" alt="로그아웃" /></a></li>
	            </ul>
	    	</c:otherwise>
		</c:choose>		
    </div>
    </div>
    <div id="new_topnavi">
    	<c:choose>
    	<c:when test="${sessionScope.loginVO.name eq '웹마스터' }">
    		<ul> 
    	</c:when>
    	 <c:otherwise>
    	 	<ul style="width:645px;"> 
    	 </c:otherwise>
    	</c:choose>
			<li class="headMenu" style="margin-left:0px;"><a href="<c:url value='/index.do' />" target="_top">HOME</a></li>
			<li class="headMenu"><a href="<c:url value='/play/musiclist.do' />" target="_top">음악</a></li>
			<li class="headMenu"><a href="<c:url value='/play/performlist.do' />" target="_top">연극</a></li> 
			<li class="headMenu"><a href="<c:url value='/play/dancelist.do' />" target="_top">무용</a></li>
			<li class="headMenu"><a href="<c:url value='/play/artlist.do' />" target="_top">미술</a></li>
			<li id="clickQna" class="headMenu"><a href="<c:url value='/uss/olh/qna/selectQnaList.do' />" target="_top">Q&A</a></li>
			<c:if test="${loginVO.userSe eq 'USR'}">
				<li class="headMenu"><a href="<c:url value='/uss/olh/qna/selectQnaAnswerList.do' />" target="_top">Q&A관리</a></li>
			</c:if>
				<li id="clickMycal" class="headMenu"><a href="<c:url value='/mycalendar/enjoycalendar.do' />" target="_top">마이캘린더</a></li>
			<c:forEach var="result" items="${list_headmenu}" varStatus="status">
			   <li class="gap"> l </li>
			   <li><a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value="${result.menuNm}"/></a></li>
			</c:forEach>
        </ul>
    </div>

</form>
