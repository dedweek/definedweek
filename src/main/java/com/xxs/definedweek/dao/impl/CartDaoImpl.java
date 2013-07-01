/*



 */
package com.xxs.definedweek.dao.impl;

import java.util.Date;

import javax.persistence.FlushModeType;

import com.xxs.definedweek.dao.CartDao;
import com.xxs.definedweek.entity.Cart;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.stereotype.Repository;

/**
 * Dao - 购物车
 * 


 */
@Repository("cartDaoImpl")
public class CartDaoImpl extends BaseDaoImpl<Cart, Long> implements CartDao {

	public void evictExpired() {
		String jpql = "delete from Cart cart where cart.modifyDate <= :expire";
		entityManager.createQuery(jpql).setFlushMode(FlushModeType.COMMIT).setParameter("expire", DateUtils.addSeconds(new Date(), -Cart.TIMEOUT)).executeUpdate();
	}

}