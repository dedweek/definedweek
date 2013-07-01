/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.ReturnsDao;
import com.xxs.definedweek.entity.Returns;
import com.xxs.definedweek.service.ReturnsService;

import org.springframework.stereotype.Service;

/**
 * Service - 退货单
 * 


 */
@Service("returnsServiceImpl")
public class ReturnsServiceImpl extends BaseServiceImpl<Returns, Long> implements ReturnsService {

	@Resource(name = "returnsDaoImpl")
	public void setBaseDao(ReturnsDao returnsDao) {
		super.setBaseDao(returnsDao);
	}

}