package egovframework.com.custom.home.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import egovframework.com.cmm.PlayApi;


@Controller
public class HomeController {
	
	@Resource(name = "playApi")
	PlayApi playApi;
	
//	@RequestMapping(value = "/munhwadiary.do", method = RequestMethod.GET)
//	public String selectPlayList(HttpServletResponse res,HttpSession session) throws Exception {
//		
//		return "egovframework/com/cmm/EgovMainView";
//	}
	
	//최신공연정보호출
	@RequestMapping(value = "/playnewapi.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getPlayList(HttpServletResponse res) throws Exception {
		
		//날짜정보 사진 몇개씩 어떻게 보일건지
		String result = playApi.getPlayList(res);
		//api통해 json형태로 바꾼 공연정보 가져옴
//		String result = playApi.showPlayDetail(res);
		return  result; 
			 
	}
	
	//장르별공연정보호출
	@RequestMapping(value = "/playrealmapi.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getPlayMusicList(@RequestBody String realmSelect, HttpServletResponse res) throws Exception {
		//날짜정보 사진 몇개씩 어떻게 보일건지
		String result = playApi.getPlayMusicList(res,realmSelect);
		//api통해 json형태로 바꾼 공연정보 가져옴
		return  result; 
			 
	}
}