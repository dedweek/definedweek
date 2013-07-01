/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.OrderLogDao;
import com.xxs.definedweek.entity.OrderLog;
import com.xxs.definedweek.service.OrderLogService;

import org.springframework.stereotype.Service;

/**
 * Service - 订单日志
 * 


 */
@Service("orderLogServiceImpl")
public class OrderLogServiceImpl extends BaseServiceImpl<OrderLog, Long> implements OrderLogService {

	@Resource(name = "orderLogDaoImpl")
	public void setBaseDao(OrderLogDao orderLogDao) {
		super.setBaseDao(orderLogDao);
	}

}