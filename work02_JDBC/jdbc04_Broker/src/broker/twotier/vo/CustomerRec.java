package broker.twotier.vo;

import java.util.ArrayList;

/*
 * 주식을 사고파는 고객 정보를 저장하는 vo 클래스
 */
public class CustomerRec {
	private String ssn;
	private String name;
	private String address;
	//추가
	//private SharesRec sharesRec; 하지 말기 / 여러개 담아야하니까 ArrayList 사용!
	private ArrayList<SharesRec> portfolio;
	
	public CustomerRec() {}
	public CustomerRec(String ssn, String name, String address, ArrayList<SharesRec> portfolio) {
		super();
		this.ssn = ssn;
		this.name = name;
		this.address = address;
		this.portfolio = portfolio;
	}
	// 처음에 주식 없을 때 필요한 생성자 / 회원가입~~
	public CustomerRec(String ssn, String name, String address) {
		super();
		this.ssn = ssn;
		this.name = name;
		this.address = address;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public ArrayList<SharesRec> getPortfolio() {
		return portfolio;
	}
	public void setPortfolio(ArrayList<SharesRec> portfolio) {
		this.portfolio = portfolio;
	}
	@Override
	public String toString() {
		return "CustomerRec [ssn=" + ssn + ", name=" + name + ", address=" + address + ", portfolio=" + portfolio + "]";
	}
	
	
	
}
