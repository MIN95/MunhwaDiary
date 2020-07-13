<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
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
    #contentsBox { 
    	width: 100%;
    	min-height: 880px; 
    }   
	#contents {     
		width:100%;
     	height:100%;
     	clear: both;
   }
                      
    #userNameBox {
		display: inline-block;
		width:100%;
       	font-size: 20px;
    }

	/* fullcalendar */
	#fullcalendarBox {
		float: left;
		margin-top: 5px;
    	margin-left: 25px;
    	width: 450px;
	}
      
	#calendar {
        margin: 13px auto;
        margin-right: 10px;
        background-color: #fff;
        
	}
     
    #calendar table tr th, #calendar table tr td {
    	font-family: 'Nanum Gothic', extra-bold;
    }
    
    #goDiary {
    	text-align:center;
    	width:140px; 
    	background-color: rgba(231, 212, 255, 0.5);
    	padding: 10px;
    	border: solid thin #ddd;
    	border-radius: 5px;
    	line-height:2px;
    	display: inline-block;
    	float: right;
    	cursor: pointer;
    }
    
    #goDiary:hover {
    	font-weight: bold;
    	color:#fff;
    	background-color: rgb(230, 210, 250);
    }
    
    .fc-today {
		background-color: #fff1b9 !important;
		font-weight: bold;
 	}
           
    .fc-sun {
    	color: red !important;
    }

   	.fc-day-grid-event > .fc-content {
   		white-space: nowrap;
   		text-overflow: ellipsis;
    	-o-text-overflow: ellipsis;
    	overflow: hidden;
	}
      
   /* bxslider */
   .bx-wrapper {
      	-moz-box-shadow: none;
      	-webkit-box-shadow: none;
      	box-shadow: none;
      	border: 0;
      	float: left;
      	margin-top: 10px;
      	padding-bottom: 0px;
      	margin-bottom: 0px;
      	background-color: rgba(0,0,0,0);
   }
   
   /* controls */
	.fas {
		color: rgba(138, 138, 138,0.7);
	}
	
	.fas:hover {
		color: rgba(133, 133, 133,0.9);
	}                        
	
	#slider-prev {
		float: left;
		position: absolute;
		top: 290px;
		left: 85px;
	}

	#slider-next {
		float: right;
		position: absolute;
		top: 290px;
		right: 85px;
	}
	
	/* img hover */
	#mainImg img:hover {
		box-shadow: 1px 1px 13px #000;
	}
	
	#mainImg a {
		 text-decoration: none;
	}   
    /* bxslider end************/  
    
   .name {
   		height:55px;
      	font-family: 'Nanum Gothic', extra-bold;
      	display: block;
      	text-overflow: ellipsis;
   		white-space: nowrap;
		overflow:hidden;
		font-size: 18px;
		line-height: 25px;
		color: #000;
		padding-top:6px;
    }
    
	#realmBox {
		width: 990px;     
		border: 0;
		float: left;
		margin-top: 10px; 
	}
    
    #realm {
		width: 558px;
    	height: 59px;
    	margin: 0 auto;
    	margin-bottom:10px;
    	border: solid thin #e2e2e2;
    	border-radius: 10px;
    	overflow: hidden;
    }
     
    #realm ul{
    	overflow: hidden;
       	list-style:none;
    }
    
    #realm ul li {
		margin: 0 0 0 0;
		width: 139px; 
		height:100%;
		padding: 15px;
		margin-bottom:10px;
		font-size: 20px;
		text-align:center;
		font-weight : bold;
		float: left;
		cursor: pointer;
    }
    
    #realm ul li:hover {
		color: black;
		background-color: rgba(231, 212, 255, 0.5);
   }
    #showMusicPlay {
		width: 800px;
		height:380px;
		border: 0;
		float: left;
    }
     
    .realmName {
    	font-family: 'Nanum Gothic', extra-bold;
		text-overflow: ellipsis; 
		white-space: nowrap; 
		overflow: hidden;
		display:block;
		font-size: 16px;
		line-height: 25px;
		font-weight: bold;
		color: #000;
		text-align: center;
		padding-top:7px;
    }

	#calStart {
		border: solid 2px #ddd;
		border-radius: 10px;
		padding: 15px;
		background-color: rgba(231, 212, 255, 0.5);
		cursor: pointer; 
	}
	
	#calStart:hover {
		color: #fff;
		font-weight: bold;
		background-color: rgb(231, 212, 255);
	}
	
   </style>
</head>
<body topmargin="0" leftmargin="0">
<!-- header -->
<c:import url="../head.jsp" />
<div id="contentsBox">
   	<div id="contents">
		<div id="conBox1" style="width:100%;height: 450px;">
			<div style="width: 70px;margin: 0 auto;padding-top: 15px;"><h1>NEW</h1></div>
           	<div id="sliderImg" class="bx-wrapper" style="visibility:hidden">
            	<div class="bxslider">
            	</div>
           	</div>
	    	<span class="bxBtn" id="slider-prev"></span>  
	    	<span class="bxBtn" id="slider-next"></span>    	
		</div>
        <div id="conBox2" style="width:1519px;height: 430px;margin: 0 auto;">
	   		<div id="realmBox" class="text-center">
	            <div id="realm">
	               <ul>
	                  <li id="realmMusic" class="realmVal">음악</li>
	                  <li class="realmVal">연극</li>
	                  <li class="realmVal">무용</li>
	                  <li class="realmVal">미술</li>
	               </ul>
	            </div>
	            <div id="showrealmPlay">
	            </div>
	         </div>
		      <div id="fullcalendarBox">
		      <c:choose>
	    		<c:when test="${empty sessionScope.loginVO.name }">
		    		<div id="anonymous" class="text-center form-group col-lg-12" style="font-size: 20px;border: solid 3px #ddd;border-radius: 10px;padding: 5px;">
		    			<div class="recoBox01 text-center col-lg-12" style="padding-top:60px ;">
		    				<p>나만의 문화일기</p></br>
		    				<p>공연스케쥴과 추억을 함께 기록해보세요</p>  
		    			</div>
		    			<div class="recoBox02 col-lg-12" style="height: 100px;line-height: 100px;">  
		    				<i class="fas fa-book fa-2x"></i> 
		    				<i style="line-height: 10px;" class="fas fa-plus fa-1x"></i> 
		    				<i class="fas fa-ticket-alt fa-2x"></i> 
		    				<i class="fas fa-equals fa-1x"></i>
		    				<i class="far fa-calendar-alt fa-2x"></i>
		    			</div>
		    			<div class="recoBox03 col-lg-12" style="height: 100px;line-height: 20px;"> 
		    				<span id="calStart">마이캘린더시작하기</span>
		    			</div>
		    		</div>
	    		</c:when>
		    	<c:otherwise>
					<div id="userNameBox"><span style="line-height: 35px;"><c:out value="${sessionScope.loginVO.name }"/>님의 캘린더</span><div id="goDiary"><span>더보기</span><i class="far fa-calendar-alt"></i></div></div>
					<div id='calendar'></div>
		    	</c:otherwise>
			</c:choose>	
			</div>
		</div>
      </div>
</div>
<!-- bottom -->
<c:import url="../main_bottom.jsp" />   
<script>
	$(document).ready(function() { 
		//최신공연정보호출 
		newPlay();
	   	//음악카테고리 공연출력
	   	$("#realmMusic").click();
	   	//풀캘린더 출력
	   	calendar.render();
	     
	});//-----------------------------------------------------------------------$(document).ready is over
	//최신공연정보호출
	function newPlay() {
		$.ajax({         
			url : "/playnewapi.do",
			type : "GET",
			contentType : "application/json; charset=utf-8",
			dataType : "JSON",
			success : function(json){
			//백에서 가져온 자바스크립트(json)객체 ->원하는 값 뽑아내기
			//슬라이더에 api를 통해 호출받은 img소스 뿌리기
			data =  json.response.msgBody.perforList;
            var list = {};
            list = data;
            $.each(data, function(key, value){
            	$(".bxslider").append("<li id='mainImg' style='text-align: center;padding:10px;'><a href='/play/playdetail.do?seq="+value.seq+"'><img style='width: 300px; height: 280px;border:solid 1px #ddd;' src="+value.thumbnail+" style='border:solid thin #ddd;' alt='["+value.realmName+"]"+value.title+"' border='0'><span class='name'>"+value.title+"</span><input type='hidden' value="+value.seq+"></a></li>");
            });
            //슬라이더 환경설정
            var slider = $('.bxslider').bxSlider({  // 자동으로 슬라이드 
            	nextSelector: '#slider-next',
                prevSelector: '#slider-prev',
            	nextText: '<i class="fas fa-arrow-circle-right fa-7x"></i>',
                prevText: '<i class="fas fa-arrow-circle-left fa-7x"></i>',
				pager:false,
				moveSlides:1,
				slideWidth: 300,
				slideMargin:0, 
				minSlides: 6, //보여지는 슬라이드 최소 갯수 
				maxSlides: 6, //보여지는 슬라이드 최대 갯수 
				auto: true,        // 자동 실행 여부
			    autoHover: true,   // 마우스 호버시 정지 여부
			    speed: 500,        // 이동 속도를 설정
			    infiniteLoop: true,
			    touchEnabled : (navigator.maxTouchPoints > 0),
				onSliderLoad: function(){ 
			  		$("#sliderImg").css("visibility", "visible").animate({opacity:1}); 
			  	}
	        });
            }
            ,error:function(request,status,error){
            	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});	
	}
	
	//마이캘린더 시작하기 (로그인 전)
	$("#calStart").on("click",function(){
		location.href="/mycalendar/enjoycalendar.do";	
	});
	//마이캘린더 페이지이동 (로그인 후)
	$("#goDiary").on("click",function(){
		location.href="/mycalendar/enjoycalendar.do";	
	});
	//-----------------------------------------------------------------------fullcalendar
 	var Calendar = FullCalendar.Calendar;
	var Draggable = FullCalendarInteraction.Draggable;    
    var calendarEl = document.getElementById('calendar');
    
    // initialize the calendar   
    var calendar = new Calendar(calendarEl, {
    	plugins: [ 'interaction', 'dayGrid' ],
        header: {
        	left: 'prevYear,prev,next,nextYear',
            center: 'title',
            right: 'today dayGridMonth'
        },
        locale: 'ko',
        navLinks:true,
		displayEventTime : false,
		eventOrder : "myorder,regDate" , 
		eventLimit: true, // for all non-TimeGrid views
		 views: {
			 dayGridMonth: {
		     	eventLimit: 6 // adjust to 6 only for timeGridWeek/timeGridDay
		  }
		},
        eventSources: [{ 
        events: function(info,successCallback,failureCallback) {
        	//사용자가 찜한 공연
        	$.ajax({
            	url: '/mycalendar/selectmyplaylist.do',
                type: 'POST',
                dataType: 'json',
                data:{
                	startDate : moment(info.startStr).format('YYYYMMDD'),
                    endDate : moment(info.endStr).format('YYYYMMDD')
                },
                success: function(data) {
                	var events = [];
	                var playList = {};
	                playList = data.list;
                    $.each(playList, function(key, value){
                    	var sDate = moment(value.startDate).format('YYYY-MM-DD');
                    	var	eDate = moment(value.endDate).format('YYYY-MM-DD'); 
                  		if(data != ''){ 
                        	events.push({
		                        title: htmlEntityDec(value.title),
		                        subTitile: value.subTitle,
		                        realmCode: value.realmCode,
		                        imgUrl: value.imgUrl,
		                        contents1: value.contents1,
		                        myorder : value.rowNo,
		                        start: new Date(sDate),                
		                        end: new Date(eDate),    
		                        color : "rgba(231, 212, 255, 0.5)",
		                        textColor : "#566270"
                       		});
                       }
                           
                    });
            		//사용자가 쓴 다이어리출력         
		            $.ajax({
		           		url: '/mycalendar/selectmydiarylist.do',
		                type: 'POST',
		                dataType: 'json',
		                data:{
			                startDate : moment(info.startStr).format('YYYYMMDD'),
			                endDate : moment(info.endStr).format('YYYYMMDD')
		                },
		                success: function(data) {
	                	var diary = {};
	                	diary = data.list;
		                    $.each(diary, function(key, value){
		                	var dDate = moment(value.diaryDate).format('YYYY-MM-DD');
                                  if(data != ''){
                                  	events.push({
                                    	title: htmlEntityDec(value.diaryTitle),
                                        start: dDate,
                                        color : "#cff0da",
                                        textColor : "#566270",                                          
                                        regDate : value.diaryDate,
                                    });
                                  }
                            });
		                    //eventarray출력
                            successCallback(events);
                        }
                    });
                }
//                 ,error:function(request, error) {
//         			// error 발생 이유를 알려준다.
//         		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

//         		}


            });
        }
        }],
        //공연 이벤트 mouseover시 뜨는 정보
        eventRender: function(info) {
        	var play = info.event;
    		var startDate = moment(play.start).format('YYYY-MM-DD');
    		var endDate = moment(play.end).format('YYYY-MM-DD');
   				if(endDate=="Invalid date"){
       				endDate = startDate;
       			}
    			if(play.extendedProps.imgUrl){
	            	var correctPlay = "<div id='eventContent'>";
	            		correctPlay += "<div><img style='width: 180px;height: 200px;' src="+play.extendedProps.imgUrl+" alt=''></div>";
	            		correctPlay += "<div style='width: 200px;padding-top:8px;text-align:center;'><span style='white-space: pre-line;'>"+play.title+"</span></div>";
	            		correctPlay += "<div style='text-align:center;id='eventDate'><span>"+startDate+' - '+endDate+"</span></div>";
	            		correctPlay += "</div>";
	            
					$(info.el).tooltip({ 
					   	html:true,
						image: true, 
					    title: correctPlay,
					    placement: 'top',
					    container: 'body'
					}); 
    			}
        }
    });//-----------------------------------------------------------------------fullcalendar end
       
	//장르별 공연정보 호출
	$(document).on('click', '.realmVal', function(){
      	$(".realmVal").css("background-color","#FFFF");
      	$(this).css("background-color","rgba(231, 212, 255, 0.5)");
      
      	//클릭한 메뉴값 넘기기
      	var realmSelect = $(this).text();
      	//장르별로 공연정보호출
      	$.ajax({   
        	url : "/playrealmapi.do",
            type : "POST",
            data : realmSelect,
            contentType : "application/json; charset=utf-8",
            dataType : "JSON",
            success : function(json){
               //백에서 가져온 자바스크립트(json)객체 ->원하는 값 뽑아내기
				data =  json.response.msgBody.perforList;
				var list = {};
                list = data;
                var array = new Array(); 
				$("#showrealmPlay").children().remove();
				
				array.push(list);
      			if(list.length==undefined){
      				list=array;
      			}
				
                $.each(list, function(key, value){
                	$("#showrealmPlay").append("<div style='display:inline-block;'><a href='/play/playdetail.do?seq="+value.seq+"'><div id='thumbnailBox' style='width: 190px; height: 300px;padding:10px;'><img src="+value.thumbnail+" style='width:180px; height: 250px;border:solid thin #ddd;' alt='["+value.realmName+"]"+value.title+"' border='0'><span class='realmName'>"+value.title+"</span></div></div></a></div>");
                });
			}  
//             ,error:function(request,status,error){
// 				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//            	}
      	});
   });
   	function htmlEntityDec(str){
	    if(str == "" || str == null){
	        return str;
	    }
	    else{
	        return str.replace(/&amp;/gi, "&").replace(/&#35;/gi, "#").replace(/&lt;/gi, "<").replace(/&gt;/gi, ">").replace(/&quot;/gi, "'").replace(/&#39;/gi, '\\').replace(/&#37;/gi, '%').replace(/&#40;/gi, '(').replace(/&#41;/gi, ')').replace(/&#43;/gi, '+').replace(/&#47;/gi, '/').replace(/&#46;/gi, '.').replace(/&#59;/g, ";");
	    }
	}
</script>
</body>
</html>