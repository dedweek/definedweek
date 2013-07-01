/*



 */
package com.xxs.definedweek.dao.impl;

import com.xxs.definedweek.dao.OrderLogDao;
import com.xxs.definedweek.entity.OrderLog;

import org.springframework.stereotype.Repository;

/**
 * Dao - 订单日志
 * 


 */
@Repository("orderLogDaoImpl")
public class OrderLogDaoImpl extends BaseDaoImpl<OrderLog, Long> implements OrderLogDao {

}