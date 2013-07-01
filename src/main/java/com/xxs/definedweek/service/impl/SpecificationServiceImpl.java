/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.SpecificationDao;
import com.xxs.definedweek.entity.Specification;
import com.xxs.definedweek.service.SpecificationService;

import org.springframework.stereotype.Service;

/**
 * Service - 规格
 * 


 */
@Service("specificationServiceImpl")
public class SpecificationServiceImpl extends BaseServiceImpl<Specification, Long> implements SpecificationService {

	@Resource(name = "specificationDaoImpl")
	public void setBaseDao(SpecificationDao specificationDao) {
		super.setBaseDao(specificationDao);
	}

}