package com.service.spring.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "writer")
public class Writer {
	private int wid;
	
	private UserInfo userInfo;
	
	
}
