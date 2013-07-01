/*



 */
package com.xxs.definedweek.service;

import com.xxs.definedweek.entity.Log;

/**
 * Service - 日志
 * 


 */
public interface LogService extends BaseService<Log, Long> {

	/**
	 * 清空日志
	 */
	void clear();

}