package egovframework.com.custom.mycalendar.service.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.custom.mycalendar.service.PlayVo;

@Repository("playDAO")
public class PlayDAO extends EgovComAbstractDAO{
	/**
	 * 달력에 띄울 공연 목록 조회
	 * @param playVo 
	 * @param PlayVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	 public List<PlayVo> selectMonthPlayList(PlayVo playVo) throws Exception{
		 return selectList("playDAO.selectMonthPlayList", playVo);
	 }
	
	/**
	 * 클릭된 날짜에 보여줄 공연내용 조회
	 * @param playVo 
	 * @param PlayVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<PlayVo> selectDayMyPlayList(PlayVo playVo) throws Exception{
		return selectList("playDAO.selectDayMyPlayList", playVo);
	}
	
	/**
	 * 클릭된 날짜에 진행되는 공연의 총갯수 조회
	 * @param playVo 
	 * @param PlayVO - 조회할 정보가 담긴 VO
	 * @return count
	 * @exception Exception
	 */
	public int countMyPlay(PlayVo playVo) throws Exception {
		return selectOne("playDAO.countMyPlay", playVo);
	}
	
	/**
	 * 추가한 공연의 정보가 데이터베이스에 존재하는지 갯수를 조회
	 * @param playVo 
	 * @param PlayVO - 조회할 정보가 담긴 VO
	 * @return count
	 * @exception Exception
	 */
	public int confirmPlayList(PlayVo playVo) throws Exception {
		return selectOne("playDAO.confirmPlayList", playVo);
	}
	
	/**
	 * 공연정보를 등록한다.
	 * @param vo - 등록할 정보가 담긴 playVo
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int insertPlay(PlayVo playVo) throws Exception {
		return insert("playDAO.insertPlay", playVo);
	}

	
	/**
	 * 공연의 일련번호를 사용자의 테이블에 등록
	 * @param vo - 등록할 정보가 담긴 playVo
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int insertMyPlay(PlayVo playVo) throws Exception {
		return insert("playDAO.insertMyPlay", playVo);
	}
	
	/**
	 * 공연정보가 참조되고 있는지의 여부 확인
	 * @param vo - 비교할 정보가 담긴 playVo
	 * @return count
	 * @exception Exception
	 */
	public int confirmOtherList(PlayVo playVo) throws Exception {
		return selectOne("playDAO.confirmOtherList", playVo);
	}
	
	/**
	 * 사용자 본인이 해당 공연에 대한 정보를 한번이상 쓰고있는지
	 * @param vo - 비교할 정보가 담긴 playVo
	 * @return count
	 * @exception Exception
	 */
	public int confirmMyPlayList(PlayVo playVo) throws Exception {
		return selectOne("playDAO.confirmMyPlayList", playVo);
	}
	
	/**
	 * 사용자의 테이블에서 해당공연의 일련번호를 삭제
	 * @param vo - 등록할 정보가 담긴 playVo
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int deleteMyPlay(PlayVo playVo) throws Exception {
		return delete("playDAO.deleteMyPlay", playVo);
	}
	
	/**
	 * 해당공연의 정보를 삭제
	 * @param vo - 등록할 정보가 담긴 playVo
	 * @return 등록 결과
	 * @exception Exception
	 */
	public int deletePlay(PlayVo playVo) throws Exception {
		return delete("playDAO.deletePlay", playVo);
	}
	
	/**
	 * 해당공연을 내가 이미 담았는지 확인
	 * @param vo - 조회할 정보가 담긴 playVo
	 * @return 조회 결과
	 * @exception Exception
	 */
	public int confirmMyPlay(PlayVo playVo) {
		return selectOne("playDAO.confirmMyPlay",playVo);
	}
}
