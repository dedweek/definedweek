/*



 */
package com.xxs.definedweek.dao;

import com.xxs.definedweek.entity.Cart;

/**
 * Dao - 购物车
 * 


 */
public interface CartDao extends BaseDao<Cart, Long> {

	/**
	 * 清除过期购物车
	 */
	void evictExpired();

}