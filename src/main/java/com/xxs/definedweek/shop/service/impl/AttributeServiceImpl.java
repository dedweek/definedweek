/*



 */
package com.xxs.definedweek.service.impl;

import javax.annotation.Resource;

import com.xxs.definedweek.dao.AttributeDao;
import com.xxs.definedweek.entity.Attribute;
import com.xxs.definedweek.service.AttributeService;

import org.springframework.stereotype.Service;

/**
 * Service - 属性
 * 


 */
@Service("attributeServiceImpl")
public class AttributeServiceImpl extends BaseServiceImpl<Attribute, Long> implements AttributeService {

	@Resource(name = "attributeDaoImpl")
	public void setBaseDao(AttributeDao attributeDao) {
		super.setBaseDao(attributeDao);
	}

}