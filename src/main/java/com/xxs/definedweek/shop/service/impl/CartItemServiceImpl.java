/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.CartItemDao;
import com.xxs.definedweek.entity.CartItem;
import com.xxs.definedweek.service.CartItemService;

import org.springframework.stereotype.Service;

/**
 * Service - 购物车项
 * 


 */
@Service("cartItemServiceImpl")
public class CartItemServiceImpl extends BaseServiceImpl<CartItem, Long> implements CartItemService {

	@Resource(name = "cartItemDaoImpl")
	public void setBaseDao(CartItemDao cartItemDao) {
		super.setBaseDao(cartItemDao);
	}

}