<%
 /**
  * @Class Name : EgovQnaDetail.jsp
  * @Description : EgovQnaDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2016.06.13   김연호              표준프레임워크 v3.6 개선
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<c:set var="pageTitle"><spring:message code="comUssOlhQna.qnaVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jquery-1.12.4.min.js'/>"></script>
<script type="text/javascript">
/* ********************************************************
 * 삭제처리
 ******************************************************** */

	 if("${msg}"!="") {
		 alert("${msg}");
	 }
	 
 
 function fn_egov_delete_qna(form){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		form.submit();	
	}	
}	
	
</script>
</head>
<body topmargin="0" leftmargin="0">
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<!-- header -->
<c:import url="../../../../com/head.jsp" />
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.detail" /></h2>

	<!-- 상세조회 -->
	<table class="wTable" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
	<caption>${pageTitle} <spring:message code="title.detail" /></caption>
	<colgroup>
		<col style="width: 15%;">
		<col style="width: ;">
		<col style="width: 15%;">
		<col style="width: ;">
	</colgroup>
	<tbody>
	
	
		<!-- 작성자명 -->
		<tr>
			<th><spring:message code="table.reger" /></th>
			<td class="left" colspan="3"><c:out value="${result.wrterNm}"/></td>
		</tr>
		<!-- 작성일자 -->
		<tr>
			<th><spring:message code="table.regdate" /></th>
			<td class="left" colspan="3"><c:out value="${result.frstRegisterPnttm}"/></td>
		</tr>
		<!-- 조회수 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.inqireCo" /></th>
			<td class="left" colspan="3"><c:out value="${result.inqireCo}"/></td>
		</tr>
		<!-- 처리상태 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.qnaProcessSttusCode" /></th>
			<td class="left" colspan="3"><c:out value="${result.qnaProcessSttusCodeNm}"/></td>
		</tr>
		<!-- 질문제목 -->
		<tr>
			<th><spring:message code="comUssOlhQna.qnaVO.qestnSj" /></th>
			<td class="left" colspan="3"><c:out value="${result.qestnSj}"/></td>
		</tr>
		<!-- 질문 내용 -->
		<tr>
			<th class="vtop"><spring:message code="comUssOlhQna.qnaVO.qestnCn" /></th>
			<td class="cnt" colspan="3">
				<c:out value="${fn:replace(result.qestnCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>

		<!-- 답변 내용 -->
		<c:if test="${result.qnaProcessSttusCode ==  '2'}">
		<tr>
			<th class="vtop"><spring:message code="comUssOlhQna.qnaVO.answerCn" /></th>
			<td class="cnt" colspan="3">
				<c:out value="${fn:replace(result.answerCn , crlf , '<br/>')}" escapeXml="false" />
			</td>
		</tr>
		</c:if>
		
	</tbody>
	</table>
	<!-- 하단 버튼 -->
	<div class="btn">
	<form name="qnaForm" action="<c:url value='/uss/olh/qna/updateQnaView.do'/>" method="post" style="float:left;">
			<input type="submit" class="s_submit" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
			<input name="qaId" type="hidden" value="${result.qaId}">
		</form>
		<form name="formDelete" action="<c:url value='/uss/olh/qna/deleteQna.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
			<input type="submit" class="s_submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" /> <spring:message code="input.button" />" onclick="fn_egov_delete_qna(this.form); return false;">
			<input name="qaId" type="hidden" value="${result.qaId}">
		</form>
		<form name="formList" action="<c:url value='/uss/olh/qna/selectQnaList.do'/>" method="post" style="float:left; margin:0 0 0 3px;">
			<input type="submit" class="s_submit" value="<spring:message code="button.list" />">
		</form>
	</div><div style="clear:both;"></div>
	
</div>
<input name="cmd" type="hidden" value="">
<!-- bottom -->
<c:import url="../../../../com/main_bottom.jsp" />  
</body>
</html>
