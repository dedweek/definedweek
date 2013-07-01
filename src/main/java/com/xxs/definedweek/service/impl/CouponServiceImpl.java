/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.Page;
import com.xxs.definedweek.Pageable;
import com.xxs.definedweek.dao.CouponDao;
import com.xxs.definedweek.entity.Coupon;
import com.xxs.definedweek.service.CouponService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 优惠券
 * 


 */
@Service("couponServiceImpl")
public class CouponServiceImpl extends BaseServiceImpl<Coupon, Long> implements CouponService {

	@Resource(name = "couponDaoImpl")
	private CouponDao couponDao;

	@Resource(name = "couponDaoImpl")
	public void setBaseDao(CouponDao couponDao) {
		super.setBaseDao(couponDao);
	}

	@Transactional(readOnly = true)
	public Page<Coupon> findPage(Boolean isEnabled, Boolean isExchange, Boolean hasExpired, Pageable pageable) {
		return couponDao.findPage(isEnabled, isExchange, hasExpired, pageable);
	}

}