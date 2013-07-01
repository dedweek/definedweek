/*



 */
package com.xxs.definedweek.dao;

import java.util.List;

import com.xxs.definedweek.entity.Navigation;
import com.xxs.definedweek.entity.Navigation.Position;

/**
 * Dao - 导航
 * 


 */
public interface NavigationDao extends BaseDao<Navigation, Long> {

	/**
	 * 查找导航
	 * 
	 * @param position
	 *            位置
	 * @return 导航
	 */
	List<Navigation> findList(Position position);

}