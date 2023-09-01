package com.service.spring.aop.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAOImpl implements ReportDAO{
	
	@Autowired
	private SqlSession sqlSession;
	public static final String NS = "ns.sql.reportMapper.";
	
	@Override
	public int insertReposrt(String word) throws Exception {
		return sqlSession.insert(NS+"insertReport", word);
		
	}

	@Override
	public int updateReposrt(String word) throws Exception {
		return sqlSession.update(NS+"updateReport", word);
		
	}

	@Override
	public List selectReposrt() throws Exception {
		return sqlSession.selectList(NS+"selectReport");
	}

}
