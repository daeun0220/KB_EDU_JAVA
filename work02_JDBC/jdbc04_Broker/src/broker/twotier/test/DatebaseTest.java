package broker.twotier.test;

import broker.twotier.dao.Database;
import broker.twotier.vo.CustomerRec;

public class DatebaseTest {

	public static void main(String[] args) throws Exception{
		Database db = new Database("127.0.0.1");
		
		//db.addCustomer(new CustomerRec("777-777", "김다은", "서울시"));
		db.updateCustomer(new CustomerRec("777-777", "김다은", "Seoul"));
	}

}
