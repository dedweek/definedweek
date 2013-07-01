/*



 */
package com.xxs.definedweek.controller.shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xxs.definedweek.entity.Member;
import com.xxs.definedweek.util.WebUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Controller - 会员注销
 * 


 */
@Controller("shopLogoutController")
public class LogoutController extends BaseController {

	/**
	 * 注销
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.removeAttribute(Member.PRINCIPAL_ATTRIBUTE_NAME);
		WebUtils.removeCookie(request, response, Member.USERNAME_COOKIE_NAME);
		return "redirect:/";
	}

}