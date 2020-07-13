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
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/fullcalendar/core/main.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/fullcalendar/daygrid/main.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/bxslider/dist/jquery.bxslider.css'/>"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
	<script src="<c:url value='/js/egovframework/com/cmm/jquery-1.12.4.min.js'/>"></script> 
	<script src='/js/fullcalendar/core/main.js'></script>
	<script src='/js/fullcalendar/daygrid/main.js'></script>
	<script src='/js/fullcalendar/interaction/main.min.js'></script>
	<script src='/js/fullcalendar/timegrid/main.min.js'></script> 
	<script src='/js/fullcalendar/core/locales-all.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
	<script src="/js/bxslider/dist/jquery.bxslider.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
	<title>문화일기</title>
	<style type="text/css">
	html, body {
    	width: 100%;
    	height: 100%;
	}
	
	pre {
		margin: 0;
		padding: 0;
		width: 100%;
		border: none;
		padding:17px;
		font-family: 'Nanum Gothic', extra-bold;
		font-size: 0.9em;
		word-break:keep-all;
		white-space: pre-wrap;
		background-color: #fff; 
	}
	
	#contents {
		width: 1470px;
		height: 100%;
		margin:0 auto;
		font-size: 1.3em;
	}
	
	/*   fullcalendar   ********************************************************/
	#userNameBox {
		font-size: 30px;
    	width: 350px;
    	padding-top: 15px;
    	padding-bottom: 15px;
	}
	
	#fullcalendarBox {
		width: 850px; 
		text-align: center;
		float: left;
		padding-bottom: 50px;
	}
	
	#calendar-container {
		z-index: 1;
	}
	
	#calendar {
		margin: 0 auto;
		clear: both;
		background-color: #fff;
	}
	
	#calendar table tr th, #calendar table tr td {
		font-family: 'Nanum Gothic', extra-bold;
		font-size: 13px;
	}
	
	.fc-event {
		font-size: 1.1em;
	}

	.fc-today {
		background-color: #fff1b9 !important;
		font-weight: bold;
	}
	
	.fc-sun {
		color: red !important;
	}
	
	.fc-day-grid-event>.fc-content {
		white-space: nowrap;
		text-overflow: ellipsis;
		-o-text-overflow: ellipsis;
		overflow: hidden;
	}
	
	/* tooltip content */
	.tooltip {
		position: absolute;
		width: 200px;
		padding: 10px;
	}
	
	/*  calendar detail		********************************************************/
	#contentsHead {
		float:right;
		padding: 0px;
		width: 580px;
		height: 692px;
		border: solid 2px #ddd;
		border-radius:5px;
		display: inline-block;
		text-align: center;
		overflow: hidden;
		background-color: #fff;
	}
	
	#diary {
		width: 100%;
		height: 90%;
		text-align: center;
		background-color: #fff;
	}
	
	#playBox {
		width: 70%;
		height: 35%;
		margin: 0 auto;
		margin-top: 35px;
		margin-bottom: 10px;
		clear: both;
		overflow: auto;
	}
	
	.deletePlay {
		width: 20px;
		height: 20px;
		position: absolute;
    	top: -10px;
		color: #ddd;
		cursor: pointer;
	}
	
	.deletePlay:hover {
		color: black;
	}
	
	#infoBox {
		height: 100%;
    	padding: 0;
    	padding-top: 10px;
    	line-height: 23px;
	}
	
	#infoBox #title {
		display: inline-block;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		width: 250px;
	}
	
	#infoBox div {
		display: inline-block;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	/*  diary section 	*******************************************************/
 	#diaryTitle { 
 		width: 160px; 
 		height: 100%; 
 		float: left; 
 		padding-top: 20px; 
 		margin-left: 23px; 
 		text-align: center; 
 		overflow: auto; 
 	} 
	
	.diaryTitle {
		width: 300px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		cursor: pointer; 
	}
	
	.diaryTitle:hover {
		color: #ddd;
	} 
	
	#myPlay,#myDiary {
		cursor: pointer;
	}
	
	#playAppend	{
		height: 100%;
		padding: 0;
		display: none;
		overflow: auto;
	}
	
	#morePlay {
	 	position: absolute;
    	top: 664px;
	    display: none;
	    right: 260px; 
	    width: 40px;
	    height: 40px;
	    overflow: auto;
	}
	
	
	#diaryAppend {
		height: 90%;
		padding: 0;
		display: none;
		overflow: auto;
	}
	
	#back {
		cursor: pointer;
		display: none;
		padding:0;
 		width: 50px;
 		padding-left: 20px;
	}
	
	#back:hover {
		color: #ddd;
	}
	
	#write {
		position: relative;
    	top: 225px;
    	left: 575px;
    	cursor: pointer; 
	}
	
	#write:hover {
		color: #ddd;
	}
	
	.deleteDiary {
		cursor: pointer;
		color: #ddd;
	}
	
	.deleteDiary:hover {
		color: black;
	}
	
	#diaryBtn {
		float: right;
	}
	
	#deleteDiary2 {
    	cursor: pointer;
    	color: #ccc;
    	width: 25px;
    	display: none;
	}
	
	#deleteDiary2:hover {
		color: #ddd;
	}
	
	
	#update {
    	width: 25px;
    	color: #ccc;
    	cursor: pointer;
	}
	
	#update:hover {
		color: #ddd;
	}
	
/* 	bootstrap edit */
	.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active {
    background-color: #fffff;
	}
	    
	/*  modal	  	*******************************************************/
	.dropdown-menu li a {
		cursor: pointer;
	}
	
	.fa-plus-circle {
		float: left;
		margin-top: 35px;
		margin-right: 7px;
		cursor: pointer;
	}
	
	.fa-plus-circle:hover {
		color: #ddd;
	}
	
	#thumbnailBox span {
		text-decoration: none;
		color: black;
	}
	
	.fa-angle-down {
		line-height: 15px;
		cursor: pointer;
	}
	
	.fa-angle-down:hover {
		color: #ddd;
	}
	
	#searchResult {
		overflow: auto;
		margin-top: 30px;
		margin-bottom:20px;
		height: 350px
	}
	
	#showMore {
		display: none;
		position: absolute;
		top: 410px;
		left: 532px;
	}
	
	/* 	///////////////// */
	.none {
		width: 100%;
		height: 100%;
		cursor: pointer;
	}
	 
	.none h3 {
		line-height: 560px; 
		color: rgba(0, 0, 0, 0.4);
	}
	
	.none h3:hover {
		color: rgba(0, 0, 0, 0.9);
	}
	
	/* 	diary-modal */
	.selectPlay a {
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	
	.form-group {
		margin-bottom: 0px;
	}
	
	.map {
		color: #32e364;
		cursor: pointer;
	}
	
	.map:hover {
		color: #02a129;
	}
	
	.mapBox {
		width:190px;
		height:130px;
		position: relative;
		top: -110px;
    	left: 322px;
		border: solid 1px #ddd;
		border-radius: 2px;
 		display: none; 
	}
</style>
</head>
<body topmargin="0" leftmargin="0">
<!-- header -->
<c:import url="../../com/head.jsp" />
	<div id="contents">
		<div id="userNameBox">
			<c:out value="${sessionScope.loginVO.name }" /> 님의 캘린더
			<i class="far fa-calendar-alt fa-1x" aria-hidden="true"></i>
		</div>
		<div id="fullcalendarBox">
			<div id='calendar'></div>
		</div>
		<div id="contentsHead" class="container">
			<ul class="nav nav-tabs nav-justified" style='width:100%;'>
				<li id="myPlay" role="presentation" class="active"><a>나의공연 <span id="allPlay" class="badge"></span></a></li>
				<li id="myDiary" role="presentation"><a id="myDiary">나의일기 <span class="badge" id="allDiary"></span></a></li>
			</ul>
		<div id="diary">
			<div id="playNone" class="none">
				<span><h3>공연을 등록해주세요<i class="far fa-laugh-wink fa-1x"></i></h3></span>
			</div>
			<div id="diaryNone" class="none" style="display: none">
				<span><h3>일기를 등록해주세요<i class="fas fa-pencil-alt fa-1x"></i></h3></span>
			</div>
			<div class="row form-group col-xs-12 text-left" id="back">
				<i class="fas fa-chevron-left fa-2x"></i>
			</div>
			<div class=" form-group col-xs-12" id="playAppend">
			</div>
			<div class=" form-group col-xs-12" id="diaryAppend">
			</div>
			<div class=" form-group col-xs-12 text-right"  id="diaryBtn">
				<span><i class="far fa-edit fa-2x" id='update' style="display: none; margin-right:5px;"></i></span>
				<span><i class='fas fa-trash-alt fa-2x' id='deleteDiary2'></i></span>
			</div>
		</div>
		</div>
	</div>
		<span id="morePlay"><i class="fas fa-angle-down fa-2x"></i></span>
		<span><i class="fas fa-pencil-alt fa-2x" id="write" style="display: none;"></i></span>
<!-- bottom -->
	<c:import url="../../com/main_bottom.jsp" />   
	<!-- play-Modal -->
	<div id="createEventModal" class="modal fade col-log-12">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
					</button>
					<h4>공연검색</h4>
				</div>
				<div id="modalBody" class="modal-body col-log-12">
					<div class="form-group">
						<form class="navbar-form" role="search">
							<div class="form-group form-inline">
								<div class="dropdown">
									<button class="btn btn-default dropdown-toggle" type="button"
										id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true">
										전체 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu">
										<li><a id="selectAll">전체</a></li>
										<li><a>음악</a></li>
										<li><a>연극</a></li>
										<li><a>무용</a></li>
										<li><a>미술</a></li>
									</ul>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="검색어입력"maxlength="100" id="searchText" style="width: 380px;" />
							</div>
							<button type="button" class="btn btn-default" id="searchBtn"
								style="width: 60px;">검색</button>
						</form>
					</div>
					<div class="form-group">
						<div class="form-group">
							<div class="form-group col-lg-12 text-center" id="searchResult">
								<h4 id="warn" style="line-height: 200px;">검색결과가 없습니다:(</h4>
							</div>
						</div>
					</div>
					<div class="form-group text-right">
						<span><i class="fas fa-angle-down fa-4x" id="showMore"></i></span>
					</div>
					<input type="hidden" id="page" value="1" />
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
				</div>
			</div>
		</div>
	</div>	
	<!-- diary-Modal -->
	<div id="createDiaryModal" class="modal fade col-log-12">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일기쓰기</h5>
					<button type="button" class="close" data-dismiss="modal"aria-label="Close"><span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button"id="dropdownMenu2"style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 100%;"data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">선택안함 <span class="caret"></span>
						</button>
						<ul id="matchPlay" class="dropdown-menu" aria-labelledby="dropdownMenu2" style="width: 100%;">
							<li><a id="selectNo">선택안함</a></li>
						</ul>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="제목을 써주세요"maxlength="100" id="writeTitle" style="margin-top: 13px;" />
					</div>
					<div class="form-group">
						<textarea class="form-control col-sm-12" id="writeContents"rows="9" maxlength="1000" style="margin-bottom: 15px;resize: none;"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="updateBtn" style="display: none;">수정</button>
					<button type="button" class="btn btn-primary" id="insertBtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="infoStart" value="0" />
	<input type="hidden" id="infoEnd" value="0" />
	<input type="hidden" id="todayInfo" value="0" />
	<input type="hidden" id="limit" value="0" /> 
	<input type="hidden" id="startPoint" value="0" /> 
	<input type="hidden" id="pageCount" value="1" /> 
	<input type="hidden" id="selPlay" value="0" /> 
	<input type="hidden" id="diarySeq" value="0" /> 
	<input type="hidden" id="diaryDate" value="0" /> 
	<input type="hidden" id="mdSeq" value="0" /> 
	
<script>
	$(document).ready(function() { 
		$(".menuBox").css("background-color","#E0E3DA");
		$("#myCalendar").css("background-color","#c2c4be");
		calendar.render();		//풀캘린더 출력
		var date = new Date();		//오늘날짜 다이어리 출력  
		makeDay(date);
		var todayInfo = moment(date).format('YYYY-MM-DD');
		$("#todayInfo").val(todayInfo);
		var startPoint = 0;
		getPlayList(todayInfo,startPoint);
		countPlay(todayInfo);
		countDiary(todayInfo);
		$("#myPlay").click();
	});//-----------------------------------------------------------------------$(document).ready is over
	//풀캘린더 날짜생성
	$(document).on("click", ".fc-button-active", function() {
		var date = new Date();
		makeDay(date);
	});
	function makeDay(date) {  
		var year = moment(date).format('YYYY');
		var month = moment(date).format('M');
		var day = moment(date).format('D');
		var today = year+"년 "+month+"월 "+day+"일";  
		$(".fc-center h2").text(today);
	}
	//지도
	$(document).on("click", ".map", function() {
		$(".mapBox").hide();
		$(".close").hide();
		var index = $(".map").index(this);
		$(".mapBox").eq(index).show();
		$(".close").eq(index).show();
		var place = $(".playPlace").eq(index).text();
		$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=/*JavaScript 키*/&autoload=false&libraries=services', function() {
			  daum.maps.load(function() {
				mapContainer = $('.mapBox'), // 지도를 표시할 div 
				//좌표변환
				fetch("https://dapi.kakao.com/v2/local/search/keyword.json?query="+place, {
					  headers: new Headers({ 'Authorization':'/*KakaoAK Admin키*/'})
					})
					.then(function(response) {
					    return response.json();
					})
					.then(function(myJson) {
					    gpsX=myJson.documents[0].x;
					    gpsY=myJson.documents[0].y;
					    mapOption = { 
					        center: new kakao.maps.LatLng(gpsY,gpsX), // 지도의 중심좌표
					        level: 5 // 지도의 확대 레벨
					    };
				     	map = new daum.maps.Map(mapContainer[index], mapOption);
				     	var markerPosition  = new kakao.maps.LatLng(gpsY,gpsX); 
					 	// 마커를 생성
					 	var marker = new kakao.maps.Marker({
					    position: markerPosition
					 });

					 // 마커가 지도 위에 표시되도록 설정합니다
					 marker.setMap(map);
					 map.relayout();
					});

			  });
			});
		$(document).on("click", ".close", function() {
			$(".mapBox").eq(index).hide(); 
			$(this).hide(); 
			
		});
	});
	
//-----------------------------------------------------------------------------------------------------------------Dairy crud start
	//나의공연 or 나의일기 전환
	//나의공연클릭
	$("#myPlay").on("click",function(){
		$(this).attr('class','active');
		$("#myDiary").attr('class','');
		$("#back").css("display","none");
		$("#deleteDiary2").css("display","none");
		$("#update").css("display","none");
		$("#diaryNone").css("display","none");
		$("#diaryAppend").css("display","none");
		$("#write").css("display","none");
		$(".diaryWrap2").remove();
		$(".referPlay").remove();
		var playCheck = $("#allPlay").text();
		if(playCheck==0){
			$("#playNone").css("display", "block");
			$("#playAppend").css("display","none");
		}else {
			$("#playNone").css("display", "none");
			$("#playAppend").css("display","block");
		}
	});
		
	//나의일기 클릭
	//클릭한 날짜의 일기정보 출력
	$("#myDiary").on("click",function(){ 
		var todayInfo = $("#todayInfo").val();
		$(this).attr('class','active');
		$("#playNone").css("display","none");
		$("#myPlay").attr('class','');
		$("#playAppend").css("display","none");
		$("#back").css("display","none");
		$("#deleteDiary2").css("display","none");
		$("#update").css("display","none");
		$("#morePlay").css("display","none"); 
		$("#write").css("display","none"); 
		$(".diaryWrap").remove();
		$(".diaryWrap2").remove();
		$(".referPlay").remove();
		var diaryCheck = $("#allDiary").text();
		if(diaryCheck==0){
			$("#diaryNone").css("display", "block");
			$("#write").css("display","none");
			$("#diaryAppend").css("display","none");
		}else {
			$("#write").css("display","inline-block");
			$("#diaryNone").css("display", "none");
			$("#diaryAppend").css("display","block");
		}
		//일기 리스트가져오기 
		$.ajax({ 
			url : '/mycalendar/selectmydiarylist.do',
			type : 'POST',
			dataType : 'json',
			async : false,
			data : {
				startDate : moment(todayInfo).format('YYYYMMDD')
			},
			success : function(data) {
				if (data.length != 0) {
					var diaryList = {};
					diaryList = data.list;
					$.each(diaryList, function(key, value) {
						var dDate = moment(value.diaryDate).format('YYYY-MM-DD');
						//공연정보입력
						var diaryBox = "<div class='form-group col-xs-12 diaryWrap' style='height:57px;border-bottom:solid thin #ddd;'>";
						diaryBox += "<div id='infoBox'class='col-xs-12' style='line-height:30px;'>";  
						diaryBox += "<div class='col-xs-9 text-left diaryTitleBox'><span id='"+value.myDiarySeq+"' class='diaryTitle' style='width:500px;'>"+ value.diaryTitle+ "</span></div>";
						diaryBox += "<div class='col-xs-2 text-right'><span>"+dDate+"</span></div>"
						diaryBox += "<div class='col-xs-1 text-right'><span class='deleteDiary'><i class='fas fa-trash-alt fa-1x'></i></span></div>"
						diaryBox += "</div>";
						diaryBox += "</div>";
						diaryBox += "<input type='hidden' class='md_"+value.myDiarySeq+"' value='"+value.mdSeq+"'>";
						
						$("#diaryAppend").append(diaryBox); 
						if(value.mdSeq!="0") { 
							$('#'+value.myDiarySeq).append("<span style='color: Mediumslateblue;'><i class='fas fa-ticket-alt'></i><span>");
						}
					});
				} 
			}
		});
		//글갯수가 하나도 없으면 글쓰기 버튼 하나만 보이기
		if($("#diaryNone").css("display") != "none"){
			$("#write").css("display","none");
		}
	});
	//다이어리뒤로가기
	$("#back").on("click",function(){
		$("#myDiary").click();
		$(".diaryWrap2").remove();
		$(".referPlay").remove();
		$("#write").css("display","inline-block");
	});
	//클릭한 제목의 다이어리 내용 출력
	$(document).on("click", ".diaryTitle", function() {
		var todayInfo = $("#todayInfo").val();
		var diarySeq = $(this).attr("id");
		$("#diarySeq").val(diarySeq);
		var mdSeq = $(".md_"+diarySeq).val();
		$("#mdSeq").val(mdSeq);
		$("#back").css("display","block");
		$("#deleteDiary2").css("display","inline-block");
		$("#update").css("display","inline-block");
		$("#morePlay").css("display","none");
		$("#write").css("display","none");
		$(".diaryWrap2").remove(); 
		$(".referPlay").remove();
		showDiary(todayInfo,diarySeq,mdSeq);
	});
		
	//일기 내용출력
	function showDiary(todayInfo,diarySeq,mdSeq){
		$.ajax({ 
			url : '/mycalendar/selectmydiary.do',
			type : 'POST',
			dataType : 'json',
			async : false,
			data : {
				startDate : moment(todayInfo).format('YYYYMMDD'),
				myDiarySeq : diarySeq,
				mdSeq : mdSeq
			},
			success : function(result) {
				$(".diaryWrap").remove();
				var result = result.diaryDetail;
				var diaryDate = new Date(result.diaryDate);
				var dDate = moment(result.diaryDate).format('YYYY-MM-DD');
				var sDate = moment(result.startDate).format('YYYY-MM-DD');
				var eDate = moment(result.endDate).format('YYYY-MM-DD');
				//공연정보입력
				var diaryBox = "<div class='form-group col-xs-12 diaryWrap2' style='padding:0;'>";
				diaryBox += "<div class='col-xs-12' style='height:50px;line-height:50px;border-top:solid thin #ddd;padding:0'>";  
				diaryBox += "<div class='col-xs-9 text-left'><span id="+result.myDiarySeq+" class='TitleDetail' style='width:230px;white-space: pre-wrap;word-break:keep-all;'>"+result.diaryTitle+ "</span></div>";
				diaryBox += "<div class='col-xs-3 text-right'><span>"+dDate+"</span></div>"
				diaryBox += "</div>";
				diaryBox += "<div class='col-xs-12 text-left' style='padding:0; border-top:solid thin #ddd;'>";
				diaryBox += "<pre>"+result.diaryContents+"</pre>";  
				diaryBox += "</div>"; 
				diaryBox += "</div>";
				
				$("#diaryAppend").append(diaryBox); 
				if(result.mdSeq!="0") {
					$('#'+result.myDiarySeq).append("<span style='color: Mediumslateblue;'><i class='fas fa-ticket-alt'></i><span>");
					
					var playBox = "<div class='form-group col-xs-12 referPlay' style='border-top:solid thin #ddd;padding:0;padding:0;padding-top:12px;background-color:rgba(231, 212, 255, 0.5);'>";
					playBox += "<div class='col-xs-4' style='height:115px;'><a class='thumbnail' style='border:none;margin:0;'><img src="+result.imgUrl+" alt='playpic' style='height:100px;padding-top:3px;'></a></div>";
					playBox += "<div class='col-xs-8 text-left' style='padding:0;margin-top:20px;'>";  
					playBox += "<div class='col-xs-12'><span style='margin-top:20px;width:100%;white-space: pre-wrap;word-break:keep-all;'>"+ result.title+ "</span></div>";
					playBox += "<div class='col-xs-12'><span class='playPlace'>"+ result.place+ "<i class='fas fa-map-marker-alt fa-1x map'></i></div>";
					playBox += "<div class='col-xs-12'><span>"+ sDate+ " -</span><span> "+ eDate+ "</span></div>";
					playBox += "<div class='mapBox'></div>";
					playBox += "</div>";
					//일기내용위에 붙이기
					$(".diaryWrap2").before(playBox); 
				}
					
			}
		});
	}
			
	$("#morePlay").on("click",function(){
		//더보기(limit=마지막페이지)
		var startPoint =Number($("#startPoint").val())+4;
		$("#startPoint").val(startPoint);
		var limit = $("#limit").val();
		var todayInfo = $("#todayInfo").val();
		var pageCount = $("#pageCount").val();
		$("#pageCount").val(Number(pageCount)+1);
		
		if(pageCount<limit){
			$.ajax({ 
				url : '/mycalendar/selectmyplaylist.do',
				type : 'POST',
				dataType : 'json',
				async : false,
				data : {
					startDate : moment(todayInfo).format('YYYYMMDD'),
					startPoint : startPoint
				}, 
				success : function(data) {
					var playList = {};
					playList = data.list;
					var sDate = "";
					var eDate = "";
					var event = "";
					$("#playNone").css("display", "none");
					$.each(playList,function(key, value) {
						if (data != null) {
								sDate = moment(value.startDate).format('YYYY-MM-DD');
								eDate = moment(value.endDate).format('YYYY-MM-DD');
								//공연정보입력
								var playBox = "<div class='form-group col-xs-12 nopadding' style='height:118px;border-top:solid thin #ddd'>";
								playBox += "<div class='col-xs-4' style='height:115px;'><a href='http://localhost:8080/play/playdetail.do?seq="+ value.seq+ "' class='thumbnail' style='margin:0;'><img src="+value.imgUrl+" alt='' style='height:100px;padding-top:3px;'></a></div>";
								playBox += "<div id='infoBox'class='col-xs-8 text-left'>";  
								playBox += "<div class='col-xs-12'><span id='realmName' class='playInfo'>"+ value.realmName+ "</span></div>";
								playBox += "<div class='col-xs-12'><span id='title' class='playInfo'>"+ value.title+ "</span></div>";
								playBox += "<div class='col-xs-12'><span class='playInfo playPlace'>"+ value.place+ "<i class='fas fa-map-marker-alt fa-1x map'></i></div>";
								playBox += "<div class='col-xs-12'><span id='start' class='playInfo'>"+ sDate+ " </span><span id='end' class='playInfo'>- "+ eDate+ "</span></div>";
								playBox += "<div class='col-xs-12 text-right'><span><i class='fas fa-trash-alt fa-1x deletePlay'></i></span></div>";
								playBox += "<input type='hidden' class='playSeq' value='"+value.seq+"'/>";
								playBox += "</div>";
								
								$("#playAppend").append(playBox); 
								$("#matchPlay").append("<li class='selectPlay'><a>"+ value.title+ "</a><input type='hidden' class='selectSeq' value="+value.seq+"></li>");
							}
					});
				}
			});
		}
	});
		
	//일기 작성 모달띄우기
	$("#diaryNone").on("click", function() {
		$('#writeTitle').focus();
		$('#writeTitle').val("");
		$('#writeContents').val("");
		$('#createDiaryModal').modal('show');
		$("#selectNo").click();
	});
	
	$(document).on("click", ".selectPlay", function() {
		var index = $(".selectPlay").index(this);
		var mdSeq = $(".selectSeq").eq(index).val();
		$("#selPlay").val(mdSeq);
		console.log(mdSeq);
	});
	
	$("#write").on("click",function(){
		$("#diaryNone").click();
	});

	//일기등록
	$("#insertBtn").on("click", function() {
		var diaryTitle = "";
		var diaryContents = "";
		var mdSeq = "";
		var diaryDate = "";
		diaryDate = $("#todayInfo").val();					
		diaryTitle = $('#writeTitle').val();
		diaryContents = $('#writeContents').val();
		var result = $.trim($("#dropdownMenu2").text());
		if(result=="선택안함") {
			$("#selPlay").val(0);
		}
		mdSeq =$("#selPlay").val();
		
		if(diaryTitle==""){
			alert("제목을 입력해주세요");
			return false;
		}
		if(diaryContents=="") {
			alert("내용을 입력해주세요");
			return false;
		}
		
		var myDiaryVo = {
			"diaryTitle" : diaryTitle,
			"diaryContents" : diaryContents,
			"diaryDate"  : diaryDate,
			"mdSeq" : mdSeq
		}
		createDiary(myDiaryVo);
	}); 

	//일기등록성공
	function createDiary(myDiaryVo) {
		var todayInfo = $("#todayInfo").val();
		$.ajax({
			url : '/mycalendar/insertmydiary.do',
			type : 'POST',
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : myDiaryVo,
			success : function(result) {
				//일기 create 성공 
				if (result.result == 1) {
					calendar.refetchEvents();
					$('#createDiaryModal').modal("hide");
					alert("일기가 등록되었습니다");
					countDiary(todayInfo);
					//그날 누르는 트리거
					$("#myDiary").click();
				} else if (result.result == 0) {
					//일기 create 실패
					alert("다시시도해주십시오");
				}
			}
		});
	}
	
	//일기수정
	$("#update").on("click",function(){
		var diaryTitle = "";
		var diaryContents = "";
		var todayInfo = $("#todayInfo").val();
		var diarySeq = $("#diarySeq").val();
		$("#diarySeq").val(diarySeq);
		var mdSeq = $("#mdSeq").val();
		var myDiaryVo = {
				"startDate" : moment(todayInfo).format('YYYYMMDD'),
				"myDiarySeq" : diarySeq,
				"mdSeq" : mdSeq
			}
		$.ajax({ 
			url : '/mycalendar/selectmydiary.do',
			type : 'POST',
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : myDiaryVo,
			success : function(result) {
				var data = result.diaryDetail;
				var title = htmlEntityDec(data.diaryTitle);
				var contents = htmlEntityDec(data.diaryContents);
				var select="";
				var dDate = moment(data.diaryDate).format('YYYY-MM-DD');
				$("#writeTitle").val("");
				$("#writeContents").val("");
				$("#updateBtn").css("display","inline-block");
				$("#insertBtn").css("display","none");
				$('#createDiaryModal').modal("show");
				$("#writeTitle").val(title);
				$("#writeContents").val(contents);
				$("#diaryDate").val(dDate);
				if(data.mdSeq!=0) {
					select=data.title;
					//시퀀스의 공연이름
				}else {
					select="선택안함";
				}
				$("#dropdownMenu2").text(select);
				$("#dropdownMenu2").append("<span class='caret'></span>");
				}
		});
	});
		
	//일기수정등록
	$("#updateBtn").on("click",function(){
		var todayInfo = $("#todayInfo").val();
		var mdSeq = $("#selPlay").val();
		diarySeq = $("#diarySeq").val();
		var diaryDate = "";
		diaryDate = $("#diaryDate").val();		
		diaryTitle = $('#writeTitle').val();
		diaryContents = $('#writeContents').val();
		var result = $.trim($("#dropdownMenu2").text());
		if(result=="선택안함") {
			$("#selPlay").val(0);
		}
		if(diaryTitle==""){
			alert("제목을 입력해주세요");
			return false;
		}
		if(diaryContents=="") {
			alert("내용을 입력해주세요");
			return false;
		}
		var myDiaryVo = {
			"diaryTitle" : diaryTitle,
			"diaryContents" : diaryContents,
			"diaryDate"  : diaryDate,
			"mdSeq" : mdSeq,
			"myDiarySeq" : diarySeq
		}
		//파라미터 전달
		$.ajax({
			url : '/mycalendar/updatemydiary.do',
			type : 'POST',
			dataType : 'json',
			data : myDiaryVo, 
			success : function(result) {
				//일기 update 성공 
				if (result.result == 1) {
					alert("일기가 수정되었습니다");
					calendar.refetchEvents();
					$("#dropdownMenu2").css("pointer-events","");
					$("#updateBtn").css("display","none");
					$("#insertBtn").css("display","inline-block");
					$('#createDiaryModal').modal("hide");
					$("#diaryAppend").children().remove();
					showDiary(todayInfo,diarySeq,mdSeq);
				} else if (result.result == 0) {
					//일기 update 실패
					alert("다시시도해주십시오");
				}
			}
		});
	});
			 
	//일기삭제(상세)
	$("#deleteDiary2").on("click",function(){
		var deleteSeq = $("#diarySeq").val();
		delDiary(deleteSeq);
	});
	
	//일기삭제(리스트)
	$(document).on("click", ".deleteDiary", function() {
			var deleteSeq = $(this).parent().prevAll(".diaryTitleBox").children(".diaryTitle").attr("id");
			delDiary(deleteSeq);
	});
	
	//일기삭제
	function delDiary(deleteSeq){
		var todayInfo = $("#todayInfo").val();
		if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			var myDiarySeq = {
					"myDiarySeq":Number(deleteSeq)
			}
			$.ajax({ 
				url : '/mycalendar/deletemydiary.do',
				type : 'POST',
				dataType : 'json',
				data : myDiarySeq,
				success : function(result) {
					if(result.result==1){
						//일기삭제성공
						alert("글을 삭제하였습니다");
						calendar.refetchEvents();
						countDiary(todayInfo);
						$("#myDiary").click();
					}else { 
						//일기삭제실패
						alert("다시시도해주십시오")
					}
				}
			});
		}else{   //취소
		    return;
		}
	}
//-----------------------------------------------------------------------------------------------------------------Dairy crud end

//-----------------------------------------------------------------------------------------------------------------Play crud start
	//공연추가버튼클릭
	$("#playNone").on("click", function() {
		$('#createEventModal').modal('show');
		$('#searchText').focus();
	});

	//부트스트랩 dropbox logic
	$(document).on("click",".dropdown-menu li a",function() {
		var selText = $(this).text();
		$(this).parents().find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
	});
	//공연추가-공연검색
	//검색 엔터적용
	$('#searchText').keypress(function(event) {
		if (event.which == 13) {
			$('#searchBtn').click();
			return false;
		}
	});

	//검색 버튼클릭
	$("#searchBtn").on("click", function() {
		//셀렉트값
		var selText = $.trim($("#dropdownMenu").text());
		//검색값
		var searchText = $.trim($("#searchText").val());
		//검색시작
		callPlayList(selText, searchText);
	});

	//공연 내 스케쥴에 추가 
	$(document).on("click", ".fa-plus-circle", function() {
		var todayInfo = $("#todayInfo").val();
		var index = $(".fa-plus-circle").index(this);
		var userId = "${userId}"; 
		var seq = $('.seq').eq(index).val();
		var realmName = $('.realmName').eq(index).val();
		var title = $('.name').eq(index).text();
		var startDate = $('.startDate').eq(index).val();
		var endDate = $('.endDate').eq(index).val();
		var place = $('.place').eq(index).text();
		var gpsX = $('.gpsX').eq(index).val();
		var gpsY = $('.gpsY').eq(index).val();
		var imgUrl = $('.imgUrl').eq(index).val();
		var playVo = {
			"p_userId" : userId,
			"seq" : seq,
			"title" : title,
			"place" : place,
			"gpsX" : gpsX,
			"gpsY" : gpsY,
			"realmName" : realmName,
			"startDate" : startDate,
			"endDate" : endDate,
			"imgUrl" : imgUrl
		}
		//클릭한 공연 db에 추가-ajax
		$.ajax({
			url : '/mycalendar/insertmyplaylist.do',
			type : 'POST',
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : playVo,  
			success : function(data) {
				//공연insert 성공 
				if (data.result == 1) {
					alert("공연이 추가되었습니다");
					calendar.refetchEvents();
					$("#playAppend").children().remove();
					getPlayList(todayInfo,0);
					countPlay(todayInfo);
					$('#createEventModal').modal("hide");
					$("#myPlay").click(); 
				} else if (data.result == 0) {
					//공연insert 실패
					alert("다시시도해주십시오");
				} else if (data.result == -1) { 
					alert("이미 추가된 공연입니다");
				}
			}
		});
	});

	//공연 추가모달상태
	$('#createEventModal').on('hidden', function() {
		//페이지리셋
		//다지우고 페이지값 보냄
		$("#warn").siblings().remove();
		$("#page").val("1");
		$("#showMore").css("left", "400px");
	});
		//더보기화살표클릭 
	$("#showMore").on("click",function() {
		//셀렉트값
		var selText = $.trim($("#dropdownMenu").text());
		//검색값
		var searchText = $.trim($("#searchText").val());
		//페이지
		var cPage = "";
		cPage = $("#page").val();
		cPage++;
		$("#page").val(cPage);
		
		var searchPlay = {
			"selText" : selText,
			"searchText" : searchText,
			"cPage" : cPage
		};
		//더보기를 누를때마다 정보들 호출해서 apppend
		$.ajax({
				url : "/mycalendar/moreplayapi.do",
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
						$("#showMore").css("display","none");
						return false;
					}
					$.each(list,function(key, value) {
						thumbUrl = value.thumbnail;
						if (thumbUrl == "") {
								thumbUrl = "/images/munhwa/noimage.png";
						}
							$("#searchResult").append("<input class='seq' type='hidden' value="+value.seq+">");
							$("#searchResult").append("<input class='realmName' type='hidden' value="+value.realmName+">");
							$("#searchResult").append("<input class='startDate' type='hidden' value="+value.startDate+">");
							$("#searchResult").append("<input class='endDate' type='hidden' value="+value.endDate+">");
							$("#searchResult").append("<input class='gpsX' type='hidden' value="+value.gpsX+">");
							$("#searchResult").append("<input class='gpsY' type='hidden' value="+value.gpsY+">");
							$("#searchResult").append("<input class='imgUrl' type='hidden' value="+value.thumbnail+">");

							var searchList = "<i class='fas fa-plus-circle fa-2x'></i>";
							searchList += "<div id='thumbnailBox' style='width: 100%; height: 120px;'>";
							searchList += "<img src="+thumbUrl+" style='width:80px; height: 100px;border-top:solid thin #ddd;float:left;' alt='["+value.realmName+"]"+value.title+"' border='0'>";
							searchList += "<a href='/play/playdetail.do?seq="+ value.seq + "'>";
							searchList += "<span style='display:block;'>"+ value.realmName + "</span><span class='name'>" + value.title + "</span>";
							searchList += "<span class='date' style='display:block;'>"+ value.startDate+ " - "+ value.endDate + "</span>";
							searchList += "<span class='place' style='display:block;'>"+ value.place + "</span>";
							searchList += "</a></div>";

						$("#searchResult").append(searchList);
					});
			},
			error : function(request, status, error) {
				alert("code:" + request.status+ "\n" + "message:"+ request.responseText+ "\n" + "error:" + error);
			}
		});
	});

	//장르별 공연검색
	function callPlayList(selText, searchText) {
		var searchPlay = {
			"selText" : selText,
			"searchText" : searchText
		};
		//장르별로 공연정보 호출
		$.ajax({
			url : "/mycalendar/searchplayapi.do",
			type : "POST",
			async:false,
			data : searchPlay,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "JSON",
			success : function(json) {
				//백에서 가져온 자바스크립트(json)객체 ->원하는 값 뽑아내기
				var data = json.response.msgBody.perforList;
				var list = {};
				list = data
				var thumbUrl = "";
				var title = "";
				var searchList = "";
				var array = new Array();
				if (data != null) {
					$("#warn").siblings().remove();
					$("#warn").css("display", "none");
					if (Object.keys(list).length < 4) {
						$("#showMore").css("display", "none");
					} else {
						$("#showMore").css("display", "block");
					}
					//검색결과값이 1개일때
					array.push(list);
					if (list.length == undefined) {
						list = array;
					}

					$.each(list,function(key, value) {
						thumbUrl = value.thumbnail;
						if (thumbUrl == "") {
							thumbUrl = "/images/munhwa/noimage.png";
						}
						$("#searchResult").append("<input class='seq' type='hidden' value="+value.seq+">");
						$("#searchResult").append("<input class='realmName' type='hidden' value="+value.realmName+">");
						$("#searchResult").append("<input class='startDate' type='hidden' value="+value.startDate+">");
						$("#searchResult").append("<input class='endDate' type='hidden' value="+value.endDate+">");
						$("#searchResult").append("<input class='gpsX' type='hidden' value="+value.gpsX+">");
						$("#searchResult").append("<input class='gpsY' type='hidden' value="+value.gpsY+">");
						$("#searchResult").append("<input class='imgUrl' type='hidden' value="+value.thumbnail+">");

						var searchList = "<i class='fas fa-plus-circle fa-2x'></i>";
						searchList += "<div id='thumbnailBox' style='width: 100%; height: 120px;'>";
						searchList += "<img src="+thumbUrl+" style='width:80px; height: 100px;border-top:solid thin #ddd;float:left;' alt='["+value.realmName+"]"+value.title+"' border='0'>";
						searchList += "<a href='/play/playdetail.do?seq="+ value.seq + "'>";
						searchList += "<span style='display:block;'>"+ value.realmName+ "</span><span class='name'>"+ value.title+ "</span>";
						searchList += "<span class='date' style='display:block;'>"+ value.startDate+ " - "+ value.endDate+ "</span>";
						searchList += "<span class='place' style='display:block;'>"+ value.place+ "</span>";
						searchList += "</a></div>";

						$("#searchResult").append(searchList);
					});
				} else {
					$("#warn").siblings().remove();
					$("#warn").css("display", "block");
					$("#showMore").css("display", "none");
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}

	//공연 삭제
	$(document).on("click", ".deletePlay", function() {
		var todayInfo = $("#todayInfo").val();
		var startPoint = 0;//삭제하고 다시 처음으로
		if (confirm("정말 삭제하시겠습니까?") == true){    //확인
			var index = $(".deletePlay").index(this);
			seq = $(".playSeq").eq(index).val();
			var userId = "${userId}";
			var playVo = {
				"seq" : seq,
				"userId" : userId
			}
			//db에서 삭제할 seq가진 공연찾아서 삭제(다른사람들도 추가한 공연이면 play에서 공연정보는 삭제하지 않음)
			$.ajax({
				url : '/mycalendar/deleteplay.do',
				type : 'POST',
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : 'json',
				data : playVo,
				success : function(data) {
					//공연delete 성공 
					if (data.result == 1) {
						alert("공연을 삭제하였습니다");
						calendar.refetchEvents();
						$("#playAppend").children().remove();
						getPlayList(todayInfo,0);
						countPlay(todayInfo);
						$("#myPlay").click(); 
					} else if (data.result == 0) {
						//공연delete 실패
						alert("다시시도해주십시오");
					}
				}
			});
		}else {
	    	return;
		}
	});

//-----------------------------------------------------------------------------------------------------------------fullcalendar start
	// 풀캘린더 출력  
	var Calendar = FullCalendar.Calendar;
	var calendarEl = document.getElementById('calendar');
	var calendar = new Calendar(calendarEl,{
		customButtons : {
		addEvent : {
		text : '공연등록',
		click : function() {
				//모달띄우기
				$('#createEventModal').modal('show');
				$('#searchText').focus();
				$("#selectAll").click();
						}
					}
				},
		plugins : [ 'interaction', 'dayGrid' ],
		header : {
			left : 'prevYear,prev,next,nextYear',
			center : 'title',
			right : 'addEvent today dayGridMonth'
		},
		locale : 'ko',
		navLinks : true,
		displayEventTime : false,
		eventLimit: true, // for all non-TimeGrid views
		 views: {
			 dayGridMonth: {
		     	eventLimit: 6 // adjust to 6 only for timeGridWeek/timeGridDay
		  }
		},
		eventLimitClick : "week",
		eventOrder : "myorder,regDate" ,
		dateClick : function(info, element) {
			//선택한 날짜 테이블색상 변경
			$(".selected").css("backgroundColor","#fff");
			info.dayEl.style.backgroundColor = '#ffd2cf'; 
			info.dayEl.className += ' selected';
			
			var startPoint = 0; 
			var pageCount = 1; 
			$("#startPoint").val(startPoint);
			$("#pageCount").val(pageCount);
			var todayInfo = info.dateStr;
			$("#todayInfo").val(todayInfo);
			
			var year = moment(todayInfo).format('YYYY');
			var month = moment(todayInfo).format('M');
			var day = moment(todayInfo).format('D');
			$(".fc-center h2").text(year + "년 " + month + "월 " + day + "일");
			//뷰 정리 
			$("#count").css("display", "none");
			$("#playBox").css("display", "none");
			$("#diaryBox").css("display", "none");
			$(".playAdd").remove();
	 		$("#playAppend").children("div").remove();
			$(".selectPlay").remove();
			$(".diaryWrap").remove();
			$("#playNone").css("display","block");
			//공연정보 가져오기
			//파라미터-해당날짜 공연 가져오기
			getPlayList(todayInfo,startPoint);
			countPlay(todayInfo);
			countDiary(todayInfo);
			$("#myPlay").click();
		},
		eventSources : [ {
			events : function(info, successCallback,failureCallback) {
				//사용자가 찜한 공연정보 가져오기(event리스트에 담음)
				var infoStart = info.startStr;
				var infoEnd = info.endStr;
				//date값수정
				//hidden에  값넣기(달력상세화면 띄우는데 필요한 값)
				$("#infoStart").val(infoStart);
				$("#infoEnd").val(infoEnd);
				var events = getEvent(infoStart, infoEnd);
				if (events != null) {
					//풀캘린더 이벤트 - eventarray출력
					successCallback(events);
				} else {
					alert("페이지를 다시 로드하여주세요");
				}
			}
		} ],
		//공연 이벤트 mouseover시 뜨는 정보
		eventRender : function(info) {
			var play = info.event;
			var startDate = moment(play.start).format('YYYY-MM-DD');
			var endDate = moment(play.end).format('YYYY-MM-DD');
			if (endDate == "Invalid date") {
				endDate = startDate;
			}
			if (play.extendedProps.imgUrl) {
				var correctPlay = "<div id='eventContent'>";
				correctPlay += "<div><img style='width: 170px;height: 180px;' src="+play.extendedProps.imgUrl+" alt=''></div>";
				correctPlay += "<div style='text-align:center;padding:3px;'><span style='white-space: pre-line;'>"+ play.title + "</span></div>";
				correctPlay += "<div style='text-align:center;id='eventDate'><span>"+ startDate+ ' - '+ endDate+ "</span></div>";
				correctPlay += "</div>";

				$(info.el).tooltip({
					html : true,
					image : true,
					title : correctPlay,
					placement : 'top',
					container : 'body'
				});

			}
		}
	});
	
	//내 공연리스트 달력에 뿌리기
	function getPlayList(todayInfo,startPoint){
		//map
		var mapContainer="";
		var i =0;
		var gpsX="";
		var gpsY="";
		var map="";
		mapOption={};
		$("#allPlay").text(0);
		$("#allDiary").text(0);
		$("playAppend").children().remove();
		$.ajax({
			url : '/mycalendar/selectmyplaylist.do',
			type : 'POST',
			dataType : 'json',
			async : false,
			data : {
				startDate : moment(todayInfo).format('YYYYMMDD'),
				startPoint: startPoint
			},
			success : function(data) {
				var playList = {};
				if(data.length>0){
					$("#playNone").css("display", "none");
				}
				playList = data.list;
				var sDate = "";
				var eDate = "";
				var event = "";
				$.each(playList,function(key, value) {
					if (data != null) {
						sDate = moment(value.startDate).format('YYYY-MM-DD');
						eDate = moment(value.endDate).format('YYYY-MM-DD');
						//공연정보입력
						var playBox = "<div class='form-group col-xs-12 nopadding' style='height:118px;border-bottom:solid thin #ddd'>";
						playBox += "<button type='button' class='close' data-dismiss='modal'aria-label='Close' style='position:absolute; top:5px; right:55px; z-index:9999;opacity:1; display:none;'><span aria-hidden='true'>&times;</span></button>";
						playBox += "<div class='col-xs-4' style='height:115px;'><a href='http://localhost:8080/play/playdetail.do?seq="+ value.seq+ "' class='thumbnail' style='margin:0'><img src="+value.imgUrl+" alt='' style='height:100px;padding-top:3px;'></a></div>";
						playBox += "<div id='infoBox'class='col-xs-8 text-left'>";
						playBox += "<div class='col-xs-12'><span id='realmName' class='playInfo'>"+ value.realmName+ "</span></div>";
						playBox += "<div class='col-xs-12'><span id='title' class='playInfo'>"+ value.title+ "</span></div>";
						playBox += "<div class='col-xs-12'><span class='playInfo playPlace'>"+ value.place+ "<i class='fas fa-map-marker-alt fa-1x map' style='margin-left: 3px;'></i></div>";
						playBox += "<div class='col-xs-12'><span id='start' class='playInfo'>"+ sDate+ " </span><span id='end' class='playInfo'>- "+ eDate+ "</span></div>";
						playBox += "<div class='col-xs-12 text-right'><span><i class='fas fa-trash-alt fa-1x deletePlay'></i></span></div>";
						playBox += "<input type='hidden' class='playSeq' value='"+value.seq+"'/>";
						playBox += "</div>";
						playBox += "<div class='mapBox'></div>";
						
						$("#playAppend").append(playBox);
						//드롭다운창에 그날의 공연 보내기
						$("#matchPlay").append("<li class='selectPlay'><a>"+ value.title+ "</a><input type='hidden' class='selectSeq' value="+value.seq+"></li>");
					} 
				});
			}
		});
	}
		
	//다이어리 카운트
	function countDiary(todayInfo) {
		$.ajax({
			url : '/mycalendar/countmydiary.do',
			type : 'POST',
			dataType : 'json',
			async : false,
			data : {
				startDate : moment(todayInfo).format('YYYYMMDD')
			},
			success : function(data) {
				$("#allDiary").text(data.count);
			}
		});
	}
	
	//공연카운트
	function countPlay(todayInfo){
		$.ajax({
			url : '/mycalendar/countmyplay.do',
			type : 'POST',
			dataType : 'json',
			async : false,
			data : {
				startDate : moment(todayInfo).format('YYYYMMDD')
			},
			success : function(data) {
				var count = data.count;
				if (count>0) {
					$("#allPlay").text(count);
					var playCountAll = $("#allPlay").text();
					var limit = Math.ceil(playCountAll/4);
					$("#limit").val(limit); 
				}
				if (count>4) {
					$("#morePlay").css("display","block");
				}
			} 
		});
	}
	
		// event 정보 맵핑(db에서 공연정보+다이어리 내용 가져옴)
	function getEvent(infoStart, infoEnd) {
		var events = [];
		$.ajax({
			url : '/mycalendar/selectmyplaylist.do',
			type : 'POST',
			dataType : 'json',
			async : false,
			data : {
				startDate : moment(infoStart).format('YYYYMMDD'),
				endDate : moment(infoEnd).format('YYYYMMDD')
			},
			success : function(data) {
				var playList = {};
				playList = data.list;
				$.each(playList, function(key, value) {
					var title = htmlEntityDec(value.title);
					var sDate = moment(value.startDate).format('YYYY-MM-DD');
					var eDate = moment(value.endDate).format('YYYY-MM-DD');
					if (data != null) {
						events.push({ 
							seq : value.seq,
							title : title,
							realmName : value.realmName,
							imgUrl : value.imgUrl,
							place : value.place,
							myorder : value.rowNo,
							start : new Date(sDate),
							end : new Date(eDate),
							color : "rgba(231, 212, 255, 0.5)",
							textColor : "#566270"
						});
					}
				});

				//사용자가 쓴 다이어리출력         
				$.ajax({
					url : '/mycalendar/selectmydiarylist.do',
					type : 'POST',
					dataType : 'json',
					async : false,
					data : {
						startDate : moment(infoStart).format('YYYYMMDD'),
						endDate : moment(infoEnd).format('YYYYMMDD')
					},
					success : function(data) {
						var diary = {};
						diary = data.list;
						$.each(diary, function(key, value) {
							var diaryTitle = htmlEntityDec(value.diaryTitle);
							var dDate = moment(value.diaryDate).format('YYYY-MM-DD');
							if (data != '') {
								events.push({ 
									title : diaryTitle,
									regDate : value.diaryDate,
									start : new Date(dDate),
									color : "#cff0da",
									textColor : "#566270",
								});
							}
						});
					}
				});
			}
		});
		//두가지 종류의 이벤트 출력명령
		return events;
	}
	
	//text area 특수문자 치환
	function htmlEntityDec(str){
	    if(str == "" || str == null){
	        return str;
	    }
	    else{
	        return str.replace(/&amp;/gi, "&").replace(/&#35;/gi, "#").replace(/&lt;/gi, "<").replace(/&gt;/gi, ">").replace(/&quot;/gi, "'").replace(/&#39;/gi, '\\').replace(/&#37;/gi, '%').replace(/&#40;/gi, '(').replace(/&#41;/gi, ')').replace(/&#43;/gi, '+').replace(/&#47;/gi, '/').replace(/&#46;/gi, '.').replace(/&#59;/g, ";").replace(/&apos;/g, "'");
	    }
	}
	</script>
</body>
</html>