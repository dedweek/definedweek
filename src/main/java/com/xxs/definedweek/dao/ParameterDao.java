/*



 */
package com.xxs.definedweek.dao;

import java.util.List;
import java.util.Set;

import com.xxs.definedweek.entity.Parameter;
import com.xxs.definedweek.entity.ParameterGroup;

/**
 * Dao - 参数
 * 


 */
public interface ParameterDao extends BaseDao<Parameter, Long> {

	/**
	 * 查找参数
	 * 
	 * @param parameterGroup
	 *            参数组
	 * @param excludes
	 *            排除参数
	 * @return 参数
	 */
	List<Parameter> findList(ParameterGroup parameterGroup, Set<Parameter> excludes);

}