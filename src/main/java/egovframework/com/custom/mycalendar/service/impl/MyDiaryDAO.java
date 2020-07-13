package egovframework.com.custom.mycalendar.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.custom.mycalendar.service.MyDiaryVo;

@Repository("myDiaryDAO")
public class MyDiaryDAO extends EgovComAbstractDAO{
	/**
	 * 사용자가 쓴 글(일기) 목록을 조회
	 * @param myDiaryVo 
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<MyDiaryVo> selectMyDiaryList(MyDiaryVo myDiaryVo) throws Exception{
		 return selectList("myDiaryDAO.selectMyDiaryList", myDiaryVo);
	 }
	
	/**
	 * 사용자가 쓴 글(일기) 세부내용 조회
	 * @param myDiaryVo 
	 * @return 글 
	 * @exception Exception
	 */
	public MyDiaryVo selectMyDiary(MyDiaryVo myDiaryVo) throws Exception{
		 return selectOne("myDiaryDAO.selectMyDiary", myDiaryVo);
	 }
	
	/**
	 * 글 갯수 조회
	 * @param myDiaryVo 
	 * @return 조회결과
	 * @exception Exception
	 */
	public int countMyDiary(MyDiaryVo myDiaryVo) throws Exception{
		 return selectOne("myDiaryDAO.countMyDiary", myDiaryVo);
	 }
	
	/**
	 * 글추가
	 * @param myDiaryVo 
	 * @return 등록결과
	 * @exception Exception
	 */
	public int insertMyDiary(MyDiaryVo myDiaryVo) throws Exception{
		 return insert("myDiaryDAO.insertMyDiary", myDiaryVo);
	 }
	
	/**
	 * 글삭제
	 * @param myDiaryVo 
	 * @return 삭제결과
	 * @exception Exception
	 */
	public int deleteMyDiary(MyDiaryVo myDiaryVo) throws Exception{
		 return delete("myDiaryDAO.deleteMyDiary", myDiaryVo);
	 }
	
	/**
	 * 글 수정
	 * @param myDiaryVo 
	 * @return 수정결과
	 * @exception Exception
	 */
	public int updateMyDiary(MyDiaryVo myDiaryVo) throws Exception{
		 return update("myDiaryDAO.updateMyDiary", myDiaryVo);
	 }
}
