package spring.service.dao.impl;

import spring.service.dao.MemberDAO;

public class MemberDAOImpl implements MemberDAO{

	@Override
	public void register(String name, String addr) {
		System.out.println(name + ", register....성공");
		
	}

	@Override
	public void delete(String id) {
		System.out.println(id + ", delete... 성공");
		
	}

}
