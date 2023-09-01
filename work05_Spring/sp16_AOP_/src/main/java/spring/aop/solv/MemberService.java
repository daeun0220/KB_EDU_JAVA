package spring.aop.solv;

// Target Class...
public class MemberService {
	
	public void register(String name) {
		System.out.println(" register....logic...회원등록 성공");
	}
	
	public void findMember(String id) {
		System.out.println(" findMember....logic...회원검색 성공");
	}
}
