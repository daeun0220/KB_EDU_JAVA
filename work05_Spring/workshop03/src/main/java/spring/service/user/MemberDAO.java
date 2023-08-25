package spring.service.user;

import java.util.List;

import spring.service.domain.MemberVO;

public interface MemberDAO {
	int registerMember(MemberVO vo) throws Exception;
	int deleteMember(String id) throws Exception;
	int updateMember(MemberVO vo) throws Exception;
	List<MemberVO> showAllMember() throws Exception;
	MemberVO getMember(String id) throws Exception;
	String idExist(String id) throws Exception;
	
	//MemberVO getUserByPassword(MemberVO member) throws Exception;
}
