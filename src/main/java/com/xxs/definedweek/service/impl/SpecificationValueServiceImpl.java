/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.SpecificationValueDao;
import com.xxs.definedweek.entity.SpecificationValue;
import com.xxs.definedweek.service.SpecificationValueService;

import org.springframework.stereotype.Service;

/**
 * Service - 规格值
 * 


 */
@Service("specificationValueServiceImpl")
public class SpecificationValueServiceImpl extends BaseServiceImpl<SpecificationValue, Long> implements SpecificationValueService {

	@Resource(name = "specificationValueDaoImpl")
	public void setBaseDao(SpecificationValueDao specificationValueDao) {
		super.setBaseDao(specificationValueDao);
	}

}