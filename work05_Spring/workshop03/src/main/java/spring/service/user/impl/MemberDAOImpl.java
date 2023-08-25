package spring.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import spring.service.domain.MemberVO;
import spring.service.user.MemberDAO;
//자동으로 memberDAOImpl 
@Repository("memberDAOImpl")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	public static final String MAPPER_NAME = "MemberMapper.";
	
	@Override
	public int registerMember(MemberVO vo) throws Exception {
		int result = sqlSession.insert(MAPPER_NAME + "registerMember", vo);
		return result;
	}
	@Override
	public int deleteMember(String id) throws Exception {
		int result = sqlSession.delete(MAPPER_NAME + "deleterMember", id);
		return result;
	}
	@Override
	public int updateMember(MemberVO vo) throws Exception {
		int result = sqlSession.update(MAPPER_NAME + "updateMember", vo);
		return result;
	}
	@Override
	public List<MemberVO> showAllMember() throws Exception {
		return sqlSession.selectList(MAPPER_NAME + "showAllMember");
	}
	@Override
	public MemberVO getMember(String id) throws Exception {
		return sqlSession.selectOne(MAPPER_NAME + "getMember", id);
	}
	@Override
	public String idExist(String id) throws Exception {
		return sqlSession.selectOne(MAPPER_NAME + "idExist", id);
	}
	
	



}
