/*



 */
package com.xxs.definedweek.dao.impl;

import com.xxs.definedweek.dao.OrderItemDao;
import com.xxs.definedweek.entity.OrderItem;

import org.springframework.stereotype.Repository;

/**
 * Dao - 订单项
 * 


 */
@Repository("orderItemDaoImpl")
public class OrderItemDaoImpl extends BaseDaoImpl<OrderItem, Long> implements OrderItemDao {

}