package egovframework.com.custom.mycalendar.service;

import java.util.List;



public interface MyCalService {
	
	/*공연***************************************************************/
	//달력에서 보여지는 달에 진행되고 있는 공연 출력
	public List<PlayVo> selectMonthPlayList(PlayVo playVo) throws Exception;
	//클릭한 날의 공연정보 출력
	public List<PlayVo> selectDayMyPlayList(PlayVo playVo) throws Exception;
	//클릭된 날짜에 진행되고 있는 공연갯수 카운트
	public int countMyPlay(PlayVo playVo) throws Exception;
	//캘린더에 공연추가,공연정보도 등록
	public int insertPlay(PlayVo playVo) throws Exception;
	//내 캘린더에만 공연등록(이미 있는 공연정보 참조)
	public int insertMyPlay(PlayVo playVo) throws Exception;
	//공연삭제
	public int deletePlay(PlayVo playVo) throws Exception;
	
	/*일기***************************************************************/
	////db에서 mydiary정보 가져와서 홈화면 달력에 출력
	public List<MyDiaryVo> selectMyDiaryList(MyDiaryVo myDiaryVo) throws Exception;
	//일기 디테일 호출
	public MyDiaryVo selectMyDiary(MyDiaryVo myDiaryVo) throws Exception;
	//클릭된 날짜에 작성된 일기갯수 카운트
	public int countMyDiary(MyDiaryVo myDiaryVo) throws Exception;
	//일기 등록
	public int insertMyDiary(MyDiaryVo myDiaryVo) throws Exception;
	//일기 삭제
	public int deleteMyDiary(MyDiaryVo myDiaryVo) throws Exception;
	//일기 수정
	public int updateMyDiary(MyDiaryVo myDiaryVo) throws Exception;
	

}
