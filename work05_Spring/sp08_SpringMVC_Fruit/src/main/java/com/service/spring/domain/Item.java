package com.service.spring.domain;
//작업순서    1. 테이블 생성--> 2. VO 클래스--> 3. MyBatis (config/mapper)--> 4. MyBatis JUnitTest
// 5. DAO / Service 
public class Item {
	
	private int itemNumber; //item_id (스네이크케이스)  itemNumber (카멜케이스) 테이블 변수명과 VO클래스 변수명 같은지 다른지 확인 
	private String name; //item_name
	private int price;
	private String description;
	private String url ;//picture_url
	private int count;
	
	public Item(int itemNumber, String name, int price, String description, String url, int count) {
		super();
		this.itemNumber = itemNumber;
		this.name = name;
		this.price = price;
		this.description = description;
		this.url = url;
		this.count = count;
	}
	public Item() {	}
	
	public Item(int itemNumber) {		
		this.itemNumber = itemNumber;
	}
	
	public Item(int itemNumber, String name, int price, String description, String url) {
		super();
		this.itemNumber = itemNumber;
		this.name = name;
		this.price = price;
		this.description = description;
		this.url = url;		
	}
	public int getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Item [itemNumber=" + itemNumber + ", name=" + name + ", price=" + price + ", description=" + description
				+ ", url=" + url + ", count=" + count + "]";
	}	
}
