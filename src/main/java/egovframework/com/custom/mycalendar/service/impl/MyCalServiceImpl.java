package egovframework.com.custom.mycalendar.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import egovframework.com.custom.mycalendar.service.MyCalService;
import egovframework.com.custom.mycalendar.service.MyDiaryVo;
import egovframework.com.custom.mycalendar.service.PlayVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("myCalService")
public class MyCalServiceImpl extends EgovAbstractServiceImpl implements MyCalService {
	
	@Resource(name = "myDiaryDAO")
	MyDiaryDAO myDiaryDAO;
	
	@Resource(name="playDAO")
	PlayDAO playDAO;
	
	//db에서 사용자의play정보 가져와서 홈화면 달력에 출력
	@Override
	public List<PlayVo> selectMonthPlayList(PlayVo playVo) throws Exception {
		List<PlayVo> list = new ArrayList<PlayVo>();
		String endDate = "";
		endDate = playVo.getEndDate();
		if(endDate==null) {
			list = playDAO.selectDayMyPlayList(playVo);
		}else {
			list = playDAO.selectMonthPlayList(playVo);
		}
		return list;
	}
	//오늘날짜 해당공연 가져오기
	@Override
	public List<PlayVo>selectDayMyPlayList(PlayVo playVo) throws Exception {
		return playDAO.selectDayMyPlayList(playVo);
	}
	
	//내 공연에 추가
	@Override
	public int insertMyPlay(PlayVo playVo) throws Exception {
		return playDAO.insertMyPlay(playVo);
	}
	
	
	//클릭된 날짜에 진행되고 있는 공연갯수 카운트
	@Override
	public int countMyPlay(PlayVo playVo) throws Exception {
		return playDAO.countMyPlay(playVo);
	}
	
	//내 달력에 공연 추가
	@Override
	public int insertPlay(PlayVo playVo) throws Exception {
		//내가 이미 공연을 담고 있는지 확인
		int myCount = playDAO.confirmMyPlay(playVo);
		//play db에 추가하려는 공연이 이미 담겨있는지 확인
		int insertPlay = 0;
		int result = 0;
		int count = playDAO.confirmPlayList(playVo);
		System.out.println("seq확인"+playVo.getSeq());
		if(myCount!=1) {
			if(count==0) {								//해당공연정보가 존재하지않음
				insertPlay = playDAO.insertPlay(playVo);
				if(insertPlay==1) {						
					result = playDAO.insertMyPlay(playVo);
				}
			}else {										//존재
				result = playDAO.insertMyPlay(playVo);
			}
			
		}else {
			//이미 추가된 공연
			result=-1;
		}
		
		return result;
	}
	
	//내가 추가한 공연삭제
	@Override
	public int deletePlay(PlayVo playVo) throws Exception {
		//다른 사용자가 해당 공연의 정보를 참조하고 있는지 확인
		int count=0;
		int myCount = 0;
		int result = 0;
		count = playDAO.confirmOtherList(playVo);
		myCount = playDAO.confirmMyPlayList(playVo);
		if(count==0 && myCount<=1) {
			//본인만 참조하는 공연(내 myplay테이블에서 해당seq 삭제+play에서 해당seq을 가진 공연 삭제)
			playDAO.deleteMyPlay(playVo);
			result = playDAO.deletePlay(playVo);
		}else {
			//다른사용자 있음 or 내가 공연에대한 일기를 여러번 씀
			result = playDAO.deleteMyPlay(playVo);
		}
		return result;
	}
///////////////////////////diary//////////////////////////////////////////////////////////

	//db에서 mydiary정보 가져와서 홈화면 달력에 출력
	@Override
	public List<MyDiaryVo> selectMyDiaryList(MyDiaryVo myDiaryVo) throws Exception {	
		return myDiaryDAO.selectMyDiaryList(myDiaryVo);
	}
	
	//다이어리 디테일
	@Override
	public MyDiaryVo selectMyDiary(MyDiaryVo myDiaryVo) throws Exception {
		return myDiaryDAO.selectMyDiary(myDiaryVo);
	}
	
	//클릭된 날짜에 작성한 일기 갯수 조회
	@Override
	public int countMyDiary(MyDiaryVo myDiaryVo) throws Exception {
		return myDiaryDAO.countMyDiary(myDiaryVo);
	}
	
	//일기작성
	@Override 
	public int insertMyDiary(MyDiaryVo myDiaryVo) throws Exception {
		return myDiaryDAO.insertMyDiary(myDiaryVo);
	}
	
	//일기삭제
	@Override
	public int deleteMyDiary(MyDiaryVo myDiaryVo) throws Exception {
		return myDiaryDAO.deleteMyDiary(myDiaryVo);
	}
	
	//일기수정
	@Override
	public int updateMyDiary(MyDiaryVo myDiaryVo) throws Exception {
		return myDiaryDAO.updateMyDiary(myDiaryVo);
	}

}
