package com.service.spring.aop.model;

import java.util.List;

public interface ReportDAO {
	int insertReposrt(String word) throws Exception;
	int updateReposrt(String word) throws Exception;
	List selectReposrt() throws Exception;
}
