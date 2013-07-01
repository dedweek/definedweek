/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.OrderItemDao;
import com.xxs.definedweek.entity.OrderItem;
import com.xxs.definedweek.service.OrderItemService;

import org.springframework.stereotype.Service;

/**
 * Service - 订单项
 * 


 */
@Service("orderItemServiceImpl")
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem, Long> implements OrderItemService {

	@Resource(name = "orderItemDaoImpl")
	public void setBaseDao(OrderItemDao orderItemDao) {
		super.setBaseDao(orderItemDao);
	}

}