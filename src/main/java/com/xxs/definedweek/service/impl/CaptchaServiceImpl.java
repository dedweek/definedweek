/*



 */
package com.xxs.definedweek.service.impl;

import java.awt.image.BufferedImage;

import javax.annotation.Resource;

import com.xxs.definedweek.Setting;
import com.xxs.definedweek.Setting.CaptchaType;
import com.xxs.definedweek.service.CaptchaService;
import com.xxs.definedweek.util.SettingUtils;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

/**
 * Service - 验证码
 * 


 */
@Service("captchaServiceImpl")
public class CaptchaServiceImpl implements CaptchaService {

	@Resource(name = "imageCaptchaService")
	private com.octo.captcha.service.CaptchaService imageCaptchaService;

	public BufferedImage buildImage(String captchaId) {
		return (BufferedImage) imageCaptchaService.getChallengeForID(captchaId);
	}

	public boolean isValid(CaptchaType captchaType, String captchaId, String captcha) {
		Setting setting = SettingUtils.get();
		if (captchaType == null || ArrayUtils.contains(setting.getCaptchaTypes(), captchaType)) {
			if (StringUtils.isNotEmpty(captchaId) && StringUtils.isNotEmpty(captcha)) {
				try {
					return imageCaptchaService.validateResponseForID(captchaId, captcha.toUpperCase());
				} catch (Exception e) {
					return false;
				}
			} else {
				return false;
			}
		} else {
			return true;
		}
	}

}