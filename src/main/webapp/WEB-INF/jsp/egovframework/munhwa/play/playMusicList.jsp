<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
	<script src="<c:url value='/js/egovframework/com/cmm/jquery-1.12.4.min.js'/>"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<title>문화일기</title>
<style type="text/css">           
	#contents {
		font-family: 'Nanum Gothic', extra-bold;
		font-size:18px;
		color:#333;
		min-height: 1680px; 
		padding:0; 
		margin: 0;
	}
	
	#showBox {
		width: 100%;
		height: 1600px; 
		padding-top: 120px;
		padding-bottom: 70px;
	}
	
	#morePlay {
		cursor: pointer;
		position: relative;
		top:-60px;
		color: rgb(231, 212, 255);
	}
	
	#morePlay:hover {
	 color: rgb(230, 204, 226); 
	}
   </style>
</head>
<body topmargin="0" leftmargin="0">
<!-- header -->
<c:import url="../../com/head.jsp" />
	<div id="contents" class="form-group text-center ">
		<div class="col-xs-12 text-center"><h1 style='line-height:110px'><c:out value="${pageInfo}"/></h1></div>
		<div id="showBox" class="form-group text-center ">
		
		<span><i id="morePlay" class="fas fa-angle-down fa-4x"></i></span>
		</div>
	</div>
<!-- bottom -->
<input id="nowPage" type="hidden" value="1">
<c:import url="../../com/main_bottom.jsp" />   
<script>
	$(document).ready(function(){ 
		var list = ${list};
		var appendList = "";
		var count = 0;
		$.each(list, function(key, value) {
			if(count % 4 == 0) {
				$("#morePlay").before("<div id='show_"+count+"' class='col-xs-12 showList' style='padding-bottom:15px;'></div>");
			}
			if(count<4) { 
				$("#show_0").append(makeShow(value));
			}else if(count>=4&&count<8) {
				$("#show_4").append(makeShow(value));
			}else if(count>=8&&count<12) {
				$("#show_8").append(makeShow(value));
			}else if(count>=12&&count<16) {
				$("#show_12").append(makeShow(value));
			}
		count++;
	  }); 
		
   });////////////////////////////////////////////////////////////$(document).ready is over
   
   $("#morePlay").on("click",function(){
	   var pageInfo = "${pageInfo}";
	   var totalPage = ${totalPage};
	   var nowPage = $("#nowPage").val(); 
	   var count = 0;
	   var cPage = Number(nowPage) + 1;
	   $("#nowPage").val(cPage);
	   if(cPage>totalPage){
		   return false;
	   }
	   var searchPlay = {
				"selText" : pageInfo,
				"searchText" : "selectAll",
				"cPage" : cPage
		};
	   $.ajax({
			url : "/play/moreplayapi.do",
			type : "POST",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : searchPlay,
			dataType : "JSON",
			success : function(json) {
				//백에서 가져온 자바스크립트(json)객체 ->원하는 값 뽑아내기
				data = json.response.msgBody.perforList;
				var list = {};
				list = data;
				var thumbUrl = "";
				var title = "";
				var searchList = "";

				if (data == null) {
					$("#morePlay").css("display","none");
					return false;
				}
					console.log(list);
				$.each(list,function(key, value) {
					thumbUrl = value.thumbnail;
					if (thumbUrl == "") {
							thumbUrl = "/images/munhwa/noimage.png";
					}
					if(count % 4 == 0) {
						$("#morePlay").before("<div id='show_"+nowPage+"_"+count+"' class='col-xs-12 showList' style='padding-bottom:15px;'></div>");
					}
					if(count<4) {
						$("#show_"+nowPage+"_0").append(makeShow(value));
					}else if(count>=4&&count<8) {
						$("#show_"+nowPage+"_4").append(makeShow(value));
					}else if(count>=8&&count<12) {
						$("#show_"+nowPage+"_8").append(makeShow(value));
					}else if(count>=12&&count<16) {
						$("#show_"+nowPage+"_12").append(makeShow(value));
					}
					count++;
				});
		},
		error : function(request, status, error) {
			alert("code:" + request.status+ "\n" + "message:"+ request.responseText+ "\n" + "error:" + error);
		}
	});
   });
   function makeShow(value) {
	   	appendList = '<div class="col-xs-3" style="padding-bottom:10px;">';
		appendList += '<a href="http://localhost:8080/play/playdetail.do?seq='+value.seq +'" class="thumbnail">';
		appendList += '<img style="height:300px;" src="'+value.thumbnail+'" alt="['+value.title+']">';
		appendList += '</a>'; 
		appendList += '<span style="width:200px;white-space: pre-wrap;word-break:keep-all;">'+value.title+'</span>';
		return appendList;
   }
</script>
</body>
</html>