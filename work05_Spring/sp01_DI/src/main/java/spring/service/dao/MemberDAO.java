package spring.service.dao;

public interface MemberDAO {
	void register(String name, String addr);
	void delete(String id);
}
