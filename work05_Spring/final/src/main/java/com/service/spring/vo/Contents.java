package com.service.spring.vo;



import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "contents")
public class Contents { 
	private int id;  
	private String category;
	private String name;
	private String content;
	private String image;
	private List<Date> day;
	private int targetAmount;
	private int sum;
	private int like;
	
	
	
}
