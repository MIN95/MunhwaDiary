package egovframework.com.custom.play.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import egovframework.com.cmm.PlayApi;
import egovframework.com.custom.mycalendar.service.PlayVo;

@Controller
@RequestMapping("/play")
public class PlayController {
	
	@Resource(name = "playApi")
	PlayApi playApi;
	
	//공연정보상세페이지
	@RequestMapping(value = "/playdetail.do", method = RequestMethod.GET)
	public String selectPlayList(HttpServletResponse res) throws Exception {
		return "egovframework/munhwa/play/playDetail";
	} 
	
	//공연정보상세정보 출력(api)
	@RequestMapping(value = "/playdetailapi.do", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String showPlayDetail(int seq,HttpServletResponse res) throws Exception {
		//api통해 json형태로 바꾼 공연정보 가져옴
		String result = playApi.showPlayDetail(res,seq);
		return  result; 
	}
	
	//음악메뉴
	@RequestMapping(value = "/musiclist.do", method = RequestMethod.GET)
	public String selectMusicsList(HttpServletResponse res,Model model) throws Exception {
		String selText = "음악";
		model.addAttribute("pageInfo", selText);
		String searchText = "selectAll";
		String result = playApi.searchPlayList(selText,searchText,res);
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
        JsonNode node = new ObjectMapper().readTree(result);
        JsonNode perforList = node.get("response").get("msgBody").get("perforList");
        model.addAttribute("list", perforList); 
        
        //페이징
        JsonNode gettotalCount = node.get("response").get("msgBody").get("totalCount");
        int totalCount = Integer.parseInt(gettotalCount.toString());
        int totalPage = (int) Math.ceil(totalCount)/16;
        model.addAttribute("totalPage",totalPage);

		return "egovframework/munhwa/play/playMusicList";
	}  
	
	
	//연극메뉴
	@RequestMapping(value = "/performlist.do", method = RequestMethod.GET)
	public String selecrPerformList(HttpServletResponse res,Model model) throws Exception {
		String selText = "연극";
		model.addAttribute("pageInfo", selText);
		String searchText = "selectAll";
		String result = playApi.searchPlayList(selText,searchText,res);
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
        JsonNode node = new ObjectMapper().readTree(result);
        JsonNode perforList = node.get("response").get("msgBody").get("perforList");
        model.addAttribute("list", perforList); 
        
        //페이징
        JsonNode gettotalCount = node.get("response").get("msgBody").get("totalCount");
        int totalCount = Integer.parseInt(gettotalCount.toString());
        int totalPage = (int) Math.ceil(totalCount)/16;
        model.addAttribute("totalPage",totalPage);

		return "egovframework/munhwa/play/playMusicList";
	}
	
	//무용메뉴
	@RequestMapping(value = "/dancelist.do", method = RequestMethod.GET)
	public String selecrDanceList(HttpServletResponse res,Model model) throws Exception {
		String selText = "무용";
		model.addAttribute("pageInfo", selText);
		String searchText = "selectAll";
		String result = playApi.searchPlayList(selText,searchText,res);
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
        JsonNode node = new ObjectMapper().readTree(result);
        JsonNode perforList = node.get("response").get("msgBody").get("perforList");
        model.addAttribute("list", perforList); 
        
        //페이징
        JsonNode gettotalCount = node.get("response").get("msgBody").get("totalCount");
        int totalCount = Integer.parseInt(gettotalCount.toString());
        int totalPage = (int) Math.ceil(totalCount)/16;
        model.addAttribute("totalPage",totalPage);

		return "egovframework/munhwa/play/playMusicList";
	}
	
	//미술메뉴
	@RequestMapping(value = "/artlist.do", method = RequestMethod.GET)
	public String selecrArtList(HttpServletResponse res,Model model) throws Exception {
		String selText = "미술";
		model.addAttribute("pageInfo", selText);
		String searchText = "selectAll";
		String result = playApi.searchPlayList(selText,searchText,res);
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
        JsonNode node = new ObjectMapper().readTree(result);
        JsonNode perforList = node.get("response").get("msgBody").get("perforList");
        model.addAttribute("list", perforList); 
        
        //페이징
        JsonNode gettotalCount = node.get("response").get("msgBody").get("totalCount");
        int totalCount = Integer.parseInt(gettotalCount.toString());
        int totalPage = (int) Math.ceil(totalCount)/16;
        model.addAttribute("totalPage",totalPage);

		return "egovframework/munhwa/play/playMusicList";
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
		return  result;  
		
	}
}
