package com.service.spring.dao;

import java.util.List;

import com.service.spring.domain.Item;

public interface ItemDAO {
	List<Item> getListItem() throws Exception;

	Item getItem(Integer itemid) throws Exception;
		
	
	
}
