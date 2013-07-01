/*



 */
package com.xxs.definedweek.dao.impl;

import com.xxs.definedweek.dao.CartItemDao;
import com.xxs.definedweek.entity.CartItem;

import org.springframework.stereotype.Repository;

/**
 * Dao - 购物车项
 * 


 */
@Repository("cartItemDaoImpl")
public class CartItemDaoImpl extends BaseDaoImpl<CartItem, Long> implements CartItemDao {

}