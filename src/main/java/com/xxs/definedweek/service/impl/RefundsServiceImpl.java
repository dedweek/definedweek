/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.RefundsDao;
import com.xxs.definedweek.entity.Refunds;
import com.xxs.definedweek.service.RefundsService;

import org.springframework.stereotype.Service;

/**
 * Service - 退款单
 * 


 */
@Service("refundsServiceImpl")
public class RefundsServiceImpl extends BaseServiceImpl<Refunds, Long> implements RefundsService {

	@Resource(name = "refundsDaoImpl")
	public void setBaseDao(RefundsDao refundsDao) {
		super.setBaseDao(refundsDao);
	}

}