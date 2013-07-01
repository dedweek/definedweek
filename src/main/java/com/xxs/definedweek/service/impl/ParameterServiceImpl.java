/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.ParameterDao;
import com.xxs.definedweek.entity.Parameter;
import com.xxs.definedweek.service.ParameterService;

import org.springframework.stereotype.Service;

/**
 * Service - 参数
 * 


 */
@Service("parameterServiceImpl")
public class ParameterServiceImpl extends BaseServiceImpl<Parameter, Long> implements ParameterService {

	@Resource(name = "parameterDaoImpl")
	public void setBaseDao(ParameterDao parameterDao) {
		super.setBaseDao(parameterDao);
	}

}