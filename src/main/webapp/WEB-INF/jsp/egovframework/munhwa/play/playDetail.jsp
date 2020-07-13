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
		font-size:17px;
		height: 100%;  
		padding:0; 
		margin: 0;
	}
	
	#playRealm {
		font-size: 30px;
		line-height: 70px;
	}
	
	#playImgBox {
		width: 330px;
		height: 450px;
	}
	
	.playContentBox {
		min-height: 400px;
	}
	
	.playDetailBox {
		line-height: 25px; 
	}
	
	.playDetailBox div {
		white-space: pre-wrap;
		word-break:keep-all;
		padding-bottom: 4px;
	}
	
	/* 	map */
	
	.map {
		color: #32e364;
	}

	.mapBox {
		width:330px;
		height: 230px;
	    position: relative;
		border: solid 1px #ddd;
		border-radius: 2px;
	}
	.close {
		position:relative;
		top: -173px;
    	left: 182px; 
		font-size:28px;
		z-index:9999;
		opacity:1;
		display:none;
	}
   </style>
</head>
<body topmargin="0" leftmargin="0">
<!-- header -->
<c:import url="../../com/head.jsp" />
	<div id="contents" class="row form-group col-xs-12 text-center">
	<div class="col-xs-2"></div>
		<div class="row form-group col-xs-8" style="min-height:596px;background-color: #fff;padding:0px;margin:0px;">
		<div id="playRealm" class="row form-group col-xs-12 text-center" style="height: 60px;"></div>
			<div class="form-group col-xs-12"style="height: 100%;margin: 0 auto;"> 
				<div class="col-xs-1"></div>
				<div class="form-group col-xs-10 playContentBox">
					<div id="playImgBox" class="form-group col-xs-5 text-right"></div> 
					<div  class="form-group col-xs-1"></div>
					<div class="form-group col-xs-6 text-left playDetailBox"></div>
				</div>
				<div class="col-xs-1"></div> 
			</div>
		</div>
	</div>
<!-- bottom -->
<c:import url="../../com/main_bottom.jsp" />   
<script>
   $(document).ready(function(){
	  //주소 파라미터 얻기
	  showDetail();
   });////////////////////////////////////////////////////////////$(document).ready is over
   
   //공연상세 api출력
   function showDetail() {
	   var data = "";
	      var area = "";
	      var realmName = "";
	      var title = "";
	      var subTitle = "";
	      var startDate = "";
	      var endDate = "";
	      var place = "";
	      var price = "";
	      var contents1 = "";
	      var contents2 = "";
	      var url = "";
	      var gpsX = "";
	      var gpsY = "";
	      var imgUrl = "";
	      var placeAddr = "";
	   //주소에서 공연일련번호 얻기
	   sendParam = getUrlParams();
	   var seq = {
	    		  "seq":sendParam.seq
	      };
	   $.ajax({         
		      url : "/play/playdetailapi.do",
		      type : "POST",
		      data : seq,
		      dataType : "JSON",
		      success : function(json){
				//백에서 가져온 자바스크립트(json)객체 ->값 추출
	            data =  json.response.msgBody.perforInfo;
	            //api든 정보추출 
              	var list = {};
              	list = data;
              	if(data==undefined) {
              		alert("페이지가 삭제되었습니다");
              	     history.go(-1);	//뒤로가기
              	}
				area = data.area;
				realmName = data.realmName;
				title = data.title;
				subTitle = data.subTitle;
				startDate = data.startDate;
				endDate = data.endDate;
				place = data.place;
				price = data.price;
				contents1 = data.contents1;
				contents2 = data.contents2;
				url = data.url;
				imgUrl = data.imgUrl;
				placeAddr = data.placeAddr;
	              
	            //인자 한개씩 뽑기
				$("#playRealm").text(realmName);	
				$("#playImgBox").append("<img src="+imgUrl+" alt='["+realmName+"]"+title+"' style='width:100%;height:100%;border:solid 1px #ddd;'>");	
				$(".playDetailBox").append("<div>지역 : <span>"+area+"</span></div>");
				$(".playDetailBox").append("<div>제목 : <span>"+title+"</span></div>");
				$(".playDetailBox").append("<div>날짜 : <span>"+startDate+" - "+endDate+"</span></div>");
				$(".playDetailBox").append("<div>가격 : <span>"+price+"</span></div>");
				$(".playDetailBox").append("<div>예매 : <a href="+url+"><span style='cursor: pointer;'>예매링크</span></a></div>");
				$(".playDetailBox").append("<button type='button' class='close' data-dismiss='modal'aria-label='Close'><span aria-hidden='true' style='width:20px;height:20px;'>&times;</span></button>");
				$(".playDetailBox").append("<div>장소 : <span id='here'>"+place+"</span><i class='fas fa-map-marker-alt fa-1x map'></i></div>");
				$(".playDetailBox").append("<div class='mapBox'></div>");
				
				showMap();
			},  
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});  
   }
     
   //주소 파라미터 가져오기
	function getUrlParams() {
		var params = {};
		window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
		return params;
	}
   	//지도클릭
 	function showMap() {	   
		var place = $("#here").text();
		$.getScript('http://dapi.kakao.com/v2/maps/sdk.js?appkey=/*JavaScript 키*/&autoload=false&libraries=services', function() {
			  daum.maps.load(function() {
				mapContainer = $('.mapBox'), // 지도를 표시할 div 
				//좌표변환
				fetch("https://dapi.kakao.com/v2/local/search/keyword.json?query="+place, {
					  headers: new Headers({ 'Authorization':'/*KakaoAK Admin 키*/'})
					})
					.then(function(response) {
					    return response.json();
					})
					.then(function(myJson) {
					    var placeNo = myJson.documents.length;
					    if(placeNo!=0) {
						    gpsX=myJson.documents[0].x;
						    gpsY=myJson.documents[0].y;
	
						    mapOption = { 
						        center: new kakao.maps.LatLng(gpsY,gpsX), // 지도의 중심좌표
						        level: 5 // 지도의 확대 레벨
						    };
					     	map = new daum.maps.Map(mapContainer[0], mapOption);
					     	var markerPosition  = new kakao.maps.LatLng(gpsY,gpsX); 
						 	// 마커를 생성
						 	var marker = new kakao.maps.Marker({
						    position: markerPosition
						 });
	
						 // 마커가 지도 위에 표시되도록 설정
						 marker.setMap(map);
						 map.relayout();
					    }else {
					    	$('.mapBox').append("<img src='/images/munhwa/noimage.png'/ style='width:300px;height:100%;margin-left:50px;'>");
					    }
					});

			  });
			});
		$(document).on("click", ".close", function() {
			$(".mapBox").eq(index).hide(); 
			$(this).hide(); 
			
		});
	   
   }



   
</script>
</body>
</html>