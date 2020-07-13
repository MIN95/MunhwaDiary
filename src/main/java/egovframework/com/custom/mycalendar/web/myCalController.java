package egovframework.com.custom.mycalendar.web;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.PlayApi;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.custom.mycalendar.service.MyCalService;
import egovframework.com.custom.mycalendar.service.MyDiaryVo;
import egovframework.com.custom.mycalendar.service.PlayVo;

@Controller
@RequestMapping("/mycalendar")
public class myCalController {
	
	@Resource(name = "playApi")
	PlayApi playApi;
	
	@Resource(name = "myCalService")
	MyCalService myCalService;
	
	@RequestMapping(value = "/enjoycalendar.do", method = RequestMethod.GET)
	public String selectPlayList(HttpServletResponse res,HttpSession session) throws Exception {
		//비회원 접근못해
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		return "egovframework/munhwa/mycalendar/myCalendar";
	}
	
////////////////////////////////////////////////////about Play/////////////////////////////////////////////////
	
		//db에서 play정보 가져와서 홈화면 달력에 출력
		@RequestMapping(value = "/selectmyplaylist.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		public ModelAndView selectMyPlayList(PlayVo playVo,HttpSession session) throws Exception {
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			playVo.setP_userId(vo.getId());
			List<PlayVo> list = new ArrayList<PlayVo>();
			//인자로 날짜 정보 보내기
			list = myCalService.selectMonthPlayList(playVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("list",list);
			return mv;  
		}
		
		//클릭된 날짜에 진행되고 있는 공연갯수 카운트
		@RequestMapping(value = "/countmyplay.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		public ModelAndView countMyPlay(PlayVo playVo,HttpSession session) throws Exception {
			int count = 0;
			//인자로 날짜 정보 보내기
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			playVo.setP_userId(vo.getId());
			count = myCalService.countMyPlay(playVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("count",count);
			return mv;  
		}
		
		//장르별공연정보호출
		@RequestMapping(value ="/searchplayapi.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String searchPlayList(PlayVo playVo,HttpServletResponse res) throws Exception {
			//날짜정보 사진 몇개씩 어떻게 보일건지
			String selText = playVo.getSelText();
			String searchText = playVo.getSearchText();
			//api통해 json형태로 parse
			String result = playApi.searchPlayList(selText,searchText,res);
			return result;  
				 
		}
 
		//더보기
		@RequestMapping(value = "/moreplayapi.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String moreplay(PlayVo playVo,HttpServletResponse res) throws Exception {
			//날짜정보 사진 몇개씩 어떻게 보일건지
			String selText = playVo.getSelText();
			String searchText = playVo.getSearchText();
			String cPage = playVo.getcPage();
			String result = playApi.moreplay(selText,searchText,cPage,res);
			//api통해 json형태로 바꾼 공연정보 가져옴
			return  result;  
				 
		}
		
		@RequestMapping(value = "/insertmyplaylist.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
		public ModelAndView insertPlay(PlayVo playVo,HttpSession session) throws Exception {
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			playVo.setP_userId(vo.getId());
			//공연일련번호저장
			int result = myCalService.insertPlay(playVo);  
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("result",result);
			return  mv;  			 
		}
		
		@RequestMapping(value = "/deleteplay.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
		public ModelAndView deletePlay(PlayVo playVo,HttpSession session) throws Exception {
			//아이디세션
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			playVo.setP_userId(vo.getId());
			int result = myCalService.deletePlay(playVo);  
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("result",result);
			return  mv;  			 
		}
////////////////////////////////////////////////////about Play end///////////////////////////////////////////////
////////////////////////////////////////////////////about Diary//////////////////////////////////////////////////
		//db에서 mydiary정보 가져와서 홈화면 달력에 출력
		@RequestMapping(value = "/selectmydiarylist.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
		public ModelAndView selectMyDiaryList(MyDiaryVo myDiaryVo,HttpSession session) throws Exception {
			List<MyDiaryVo> list = new ArrayList<MyDiaryVo>();
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			myDiaryVo.setMd_userId(vo.getId());
			list = myCalService.selectMyDiaryList(myDiaryVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("list",list);
			return mv;  
		}
		
		//클릭한 다이어리 내용 호출
		@RequestMapping(value = "/selectmydiary.do", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
		public ModelAndView selectMyDiary(MyDiaryVo myDiaryVo,HttpSession session) throws Exception {
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");		//세션
			myDiaryVo.setMd_userId(vo.getId());
			
			MyDiaryVo diaryDetail = new MyDiaryVo();
			diaryDetail = myCalService.selectMyDiary(myDiaryVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("diaryDetail",diaryDetail);
			return mv;  
		}
		
		
		//클릭된 날짜에 진행되고 있는 공연갯수 카운트
		@RequestMapping(value = "/countmydiary.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		public ModelAndView countMyDairy(MyDiaryVo myDiaryVo,HttpSession session) throws Exception {
			int count = 0;
			//인자로 날짜 정보 보내기
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			myDiaryVo.setMd_userId(vo.getId());
			count = myCalService.countMyDiary(myDiaryVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("count",count);
			return mv;  
		}
		
		//mydiary 테이블에 사용자가 작성한 일기등록
		@RequestMapping(value = "/insertmydiary.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		public ModelAndView insertMyDiary(MyDiaryVo myDiaryVo,HttpSession session) throws Exception {
			int result = 0;
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			myDiaryVo.setMd_userId(vo.getId());
			result = myCalService.insertMyDiary(myDiaryVo);
			ModelAndView mv = new ModelAndView("jsonView"); 
			mv.addObject("result",result);
			return mv; 
		}
		 
		//mydiary 테이블에 사용자가 작성한 일기수정
		@RequestMapping(value = "/updatemydiary.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		public ModelAndView updateMyDiary(MyDiaryVo myDiaryVo,HttpSession session) throws Exception {
			int result = 0;
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			myDiaryVo.setMd_userId(vo.getId());
			result = myCalService.updateMyDiary(myDiaryVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("result",result);
			return mv;  
		}
		
		//mydiary 테이블에 사용자가 작성한 일기삭제
		@RequestMapping(value = "/deletemydiary.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
		public ModelAndView deleteMyDiary(MyDiaryVo myDiaryVo,HttpSession session) throws Exception {
			int result = 0;
			LoginVO vo = (LoginVO) session.getAttribute("loginVO");
			myDiaryVo.setMd_userId(vo.getId());
			result = myCalService.deleteMyDiary(myDiaryVo);
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("result",result);
			return mv;  
		}
		
////////////////////////////////////////////////////about Diary end//////////////////////////////////////////////////		
}
