/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.ShippingMethodDao;
import com.xxs.definedweek.entity.ShippingMethod;
import com.xxs.definedweek.service.ShippingMethodService;

import org.springframework.stereotype.Service;

/**
 * Service - 配送方式
 * 


 */
@Service("shippingMethodServiceImpl")
public class ShippingMethodServiceImpl extends BaseServiceImpl<ShippingMethod, Long> implements ShippingMethodService {

	@Resource(name = "shippingMethodDaoImpl")
	public void setBaseDao(ShippingMethodDao shippingMethodDao) {
		super.setBaseDao(shippingMethodDao);
	}

}