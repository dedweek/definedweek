/*



 */
package com.xxs.definedweek.dao.impl;

import com.xxs.definedweek.dao.PaymentMethodDao;
import com.xxs.definedweek.entity.PaymentMethod;

import org.springframework.stereotype.Repository;

/**
 * Dao - 支付方式
 * 


 */
@Repository("paymentMethodDaoImpl")
public class PaymentMethodDaoImpl extends BaseDaoImpl<PaymentMethod, Long> implements PaymentMethodDao {

}