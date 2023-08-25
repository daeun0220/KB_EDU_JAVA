package spring.service.user;

//데이터 가공과 관련된 레이져...
//게시판 페이징 처리로직, 통계관련 로직, 알고리즘 연결로직, 
import java.util.List;

import spring.service.domain.MemberVO;

public interface MemberService {
	
	List<MemberVO> showAllMember() throws Exception;
	MemberVO getMember(String id) throws Exception;
	String idExist(String id) throws Exception;
}
