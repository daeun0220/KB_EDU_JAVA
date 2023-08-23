package spring.service.test;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import spring.service.domain.MemberVO;



public class MyBatisMemberTestApp {
	
	public static void main(String[] args) throws Exception{
		
		Reader reader=Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(reader);
		SqlSession session=factory.openSession();
		
		//1. MemberMapper.showAllMember
		System.out.println(":: 1. showAllMember(SELECT)  ? ");
		List<MemberVO> list = session.selectList("MemberMapper.showAllMember");
		for (int i =0 ;  i < list.size() ; i++) {
			System.out.println( "<"+ ( i +1 )+"> 번째 회원.."+ list.get(i).toString() );
		}
		System.out.println("\n");
		
		//==> Test 용 UserVO instance 생성
		MemberVO member = new MemberVO("kd1284", "1284", "김다은", "양천구");
		
		//2.MemberMapper.registerMember Test
		Object obj = session.insert("MemberMapper.registerMember", member);
		session.commit(); //이 부분 반드시 해줘야 한다....mvc에서는 생략가능.
		//iBatis와 다르게 insert문의 리턴타입은 insert된 row수를 반환한다.
		System.out.println(":: 2. registerMember(INSERT)  result ? "+obj); //1
		System.out.println("\n");
		
		
		
		//3.MemberMapper.getMember Test
		MemberVO findmember = (MemberVO)session.selectOne("MemberMapper.getMember", member);
		System.out.println(":: 3. getMember(SELECT)  ? "+ findmember.getName()); //주몽
		System.out.println("\n");
			
	
		//4.MemberMapper.updateMember Test
		member.setName("다우니");
		int updateResult = session.update("MemberMapper.updateMember", member);
		session.commit(); //이부분 반드시 해줘야 한다.
		System.out.println(":: 4. updateMember(UPDATE) result ? "+ updateResult);//1
		System.out.println("\n");
		
		//5. MemberMapper.deleteMember Test
		int deleteResult = session.delete("MemberMapper.deleteMember", member);
		session.commit(); //이 부분 반드시 해줘야 한다.
		System.out.println(":: 5. deleteMember(DELETE) result ? "+ deleteResult);
		System.out.println("\n");
		
		//6.MemberMapper.login Test
		MemberVO loginmember = new MemberVO();
		loginmember.setId("kblife");
		loginmember.setPassword("1234");
		
		MemberVO loginmemberName = (MemberVO)session.selectOne("MemberMapper.login", loginmember);
		System.out.println(":: 6. login(SELECT)  ? "+ loginmemberName.getName() + ", 로그인 성공!"); //장보고
		System.out.println("\n");
		
	}

}
