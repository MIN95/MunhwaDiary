package egovframework.com.cmm;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.time.DateUtils;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Component;
import java.io.BufferedReader;

@Component
public class PlayApi {
	
	private static final String Servicekey =  "=" + "/*서비스키*/";
	private String realmCode = "";
	//from&to구하기
	private SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMdd");
	private Date today = new Date();
	private String to = format.format(DateUtils.addDays(today, +60));	
	private String from = "";	

	//상세출력
	public PlayApi() {
		System.out.println("PlayApi...ini...");
	} 
	
	//공연정보 상세조회(필요 파라미터-공연일련번호seq)
	public String showPlayDetail(HttpServletResponse res, int seq) throws Exception{
		String playSeq = Integer.toString(seq);
		
		StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + Servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("id","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("seq","UTF-8") + "=" + URLEncoder.encode(playSeq, "UTF-8")); /**/
        
        System.out.println(readXML(urlBuilder, res));
        return readXML(urlBuilder,res);
   }
	
	//메인페이지 공연썸네일,제목
	public String getPlayList(HttpServletResponse res) throws Exception{
		
		StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + Servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("id","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("4", "UTF-8")); /**/
        
        return readXML(urlBuilder,res);
   }
	
	//음악장르따라
	public String getPlayMusicList(HttpServletResponse res, String realmSelect) throws Exception{
		//요청파라미터인 realmCode로 치환 
		if(realmSelect.equals("무용")) {
			this.realmCode = "C000";
			this.from = format.format(DateUtils.addDays(today, -60)); 
		}else if(realmSelect.equals("음악")) {
				this.realmCode = "B000";
				this.from = format.format(DateUtils.addDays(today, -7));	
		}else if(realmSelect.equals("연극")) {
			this.realmCode  = "A000";
			this.from = format.format(DateUtils.addDays(today, -7));
		}else if(realmSelect.equals("미술")) {
			this.realmCode = "D000";
			this.from = format.format(DateUtils.addDays(today, -14));	
		}
			
		StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + Servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("realmCode","UTF-8") + "=" + URLEncoder.encode(realmCode, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode(from, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode(to, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/ 
        urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("4", "UTF-8")); /**/
        return readXML(urlBuilder,res);
	}
	
	//mycalendar 공연검색
	public String searchPlayList(String selText, String searchText, HttpServletResponse res) throws Exception {
		String rows = "4";
		//요청파라미터인 realmCode로 치환 
		if(selText.equals("음악")) {
			this.realmCode = "B000";
		}else if(selText.equals("연극")) {
			this.realmCode  = "A000";
		}else if(selText.equals("미술")) {
			this.realmCode = "D000";
		}else if(selText.equals("무용")) {
			this.realmCode = "C000";
		}else if(selText.equals("전체")) {
			this.realmCode = "";
		}
		 
		if(searchText.equals("selectAll")) {
			searchText = "";
			rows ="16";
		} 
		
		StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + Servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode("20100810", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode("23003422", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/ 
        urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode(rows, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("4", "UTF-8")); /*최신순*/
        
        //장르
        urlBuilder.append("&" + URLEncoder.encode("realmCode","UTF-8") + "=" + URLEncoder.encode(realmCode, "UTF-8"));
        //검색어(키워드)
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(searchText, "UTF-8")); 
        
        return readXML(urlBuilder,res);
	}
	
	//더보기
	public String moreplay(String selText, String searchText, String cPage, HttpServletResponse res) throws Exception {
		String rows = "5";
		//요청파라미터인 realmCode로 치환 
		if(selText.equals("음악")) {
			this.realmCode = "B000";
		}else if(selText.equals("연극")) {
			this.realmCode  = "A000";
		}else if(selText.equals("미술")) {
			this.realmCode = "D000";
		}else if(selText.equals("무용")) {
			this.realmCode = "C000";
		}else if(selText.equals("전체")) {
			this.realmCode = "";
		}
		
		if(searchText.equals("selectAll")) {
			searchText = "";
			rows ="16";
		} 
		StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + Servicekey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ComMsgHeader","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("RequestTime","UTF-8") + "=" + URLEncoder.encode("20100810:23003422", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("CallBackURI","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*Optional 필드*/
        urlBuilder.append("&" + URLEncoder.encode("MsgBody","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("from","UTF-8") + "=" + URLEncoder.encode("20100810", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("to","UTF-8") + "=" + URLEncoder.encode("23003422", "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("cPage","UTF-8") + "=" + URLEncoder.encode(cPage, "UTF-8")); /**/ 
        urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode(rows, "UTF-8")); /**/
        urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("4", "UTF-8")); /**/
        
        //장르
        urlBuilder.append("&" + URLEncoder.encode("realmCode","UTF-8") + "=" + URLEncoder.encode(realmCode, "UTF-8"));
        //검색어(키워드)
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(searchText, "UTF-8")); 
        
        return readXML(urlBuilder,res);
	}

	//원하는 종류의 api쓰기위한 파라미터를 받아 xml형태로 호출된 공연정보를 리턴함
	public String readXML(StringBuilder urlBuilder,HttpServletResponse res) throws Exception {
		URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line + "\n");
        }
        rd.close();
        conn.disconnect();
        System.out.println("api result::: "+sb.toString());
        
        //api결과로 호출된 xml을 json객체로 파싱
        String result = sb.toString();
        JSONObject xmlJSONObj = XML.toJSONObject(result);
		res.setCharacterEncoding("UTF-8");
		
		String xmlJSONObjString = xmlJSONObj.toString();	
        return xmlJSONObjString;
		
	}

}
