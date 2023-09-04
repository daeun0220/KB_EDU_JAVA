package com.service.spring.vo;

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
@Table(name = "user")
public class User {
	private int uid;
	private int identity;
	private String character;
	private List<String> interests;
	
	private UserInfo userInfo;
}
