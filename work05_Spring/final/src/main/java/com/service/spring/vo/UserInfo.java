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
@Table(name = "userInfo")
public class UserInfo {
	private String infoId;
	private String name;
	private int password;
	private String email;
	private int accounts;
	private String bank;
	
}
