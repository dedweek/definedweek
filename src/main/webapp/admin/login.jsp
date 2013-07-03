<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.interfaces.RSAPublicKey"%>
<%@page import="org.apache.commons.lang.ArrayUtils"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.xxs.definedweek.Setting"%>
<%@page import="com.xxs.definedweek.util.SettingUtils"%>
<%@page import="com.xxs.definedweek.util.SpringUtils"%>
<%@page import="com.xxs.definedweek.Setting.CaptchaType"%>
<%@page import="com.xxs.definedweek.Setting.AccountLockType"%>
<%@page import="com.xxs.definedweek.service.RSAService"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String base = request.getContextPath();
String captchaId = UUID.randomUUID().toString();
ApplicationContext applicationContext = SpringUtils.getApplicationContext();
Setting setting = SettingUtils.get();
if (applicationContext != null) {
%>
<shiro:authenticated>
<%
response.sendRedirect(base + "/admin/common/main.jhtml");
%>
</shiro:authenticated>
<%
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="login_page">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
if (applicationContext != null) {
	RSAService rsaService = SpringUtils.getBean("rsaServiceImpl", RSAService.class);
	RSAPublicKey publicKey = rsaService.generateKey(request);
	String modulus = Base64.encodeBase64String(publicKey.getModulus().toByteArray());
	String exponent = Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray());
	
	String message = null;
	String loginFailure = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if (loginFailure != null) {
		if (loginFailure.equals("org.apache.shiro.authc.pam.UnsupportedTokenException")) {
			message = "admin.captcha.invalid";
		} else if (loginFailure.equals("org.apache.shiro.authc.UnknownAccountException")) {
			message = "admin.login.unknownAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.DisabledAccountException")) {
			message = "admin.login.disabledAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.LockedAccountException")) {
			message = "admin.login.lockedAccount";
		} else if (loginFailure.equals("org.apache.shiro.authc.IncorrectCredentialsException")) {
			if (ArrayUtils.contains(setting.getAccountLockTypes(), AccountLockType.admin)) {
				message = "admin.login.accountLockCount";
			} else {
				message = "admin.login.incorrectCredentials";
			}
		} else if (loginFailure.equals("org.apache.shiro.authc.AuthenticationException")) {
			message = "admin.login.authentication";
		}
	}
	out.println(message+"|||");
	out.println(loginFailure);
%>
<title><%=SpringUtils.getMessage("admin.login.title")%> - Powered By SHOP++</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=base%>/resources/admin/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=base%>/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/jsbn.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/prng4.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rng.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/rsa.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/base64.js"></script>
<script type="text/javascript" src="<%=base%>/resources/admin/js/common.js"></script>

		<!-- Bootstrap framework -->
            <link rel="stylesheet" href="<%=base%>/resources/admin/bootstrap/css/bootstrap.min.css"  />
            <link rel="stylesheet" href="<%=base%>/resources/admin/bootstrap/css/bootstrap-responsive.min.css"  />
        <!-- theme color-->
            <link rel="stylesheet" href="<%=base%>/resources/admin/css/blue.css"  />
        <!-- tooltip -->    
			<link rel="stylesheet" href="<%=base%>/resources/admin/lib/qtip2/jquery.qtip.min.css"  />
        <!-- main styles -->
            <link rel="stylesheet" href="<%=base%>/resources/admin/css/style.css"  />
    
        <!-- favicon -->
            <link rel="shortcut icon" href="favicon.ico" />
    
        <!--  <link href="../../fonts.googleapis.com/css-family=PT+Sans.css"  rel='stylesheet' type='text/css'>  -->
    
        <!--[if lt IE 9]>
            <script src="js/ie/html5.js" ></script>
			<script src="js/ie/respond.min.js" ></script>
        <![endif]-->


<script type="text/javascript">
	$().ready( function() {
		
		var $loginForm = $("#loginForm");
		var $enPassword = $("#enPassword");
		var $username = $("#username");
		var $password = $("#password");
		var $captcha = $("#captcha");
		var $captchaImage = $("#captchaImage");
		var $isRememberUsername = $("#isRememberUsername");
		var $resultMessage = $("#resultMessage");
		
		// 记住用户名
		if(getCookie("adminUsername") != null) {
			$isRememberUsername.prop("checked", true);
			$username.val(getCookie("adminUsername"));
			$password.focus();
		} else {
			$isRememberUsername.prop("checked", false);
			$username.focus();
		}
		
		// 更换验证码
		$captchaImage.click( function() {
			$captchaImage.attr("src", "<%=base%>/admin/common/captcha.jhtml?captchaId=<%=captchaId%>&timestamp=" + (new Date()).valueOf());
		});
		
		// 表单验证、记住用户名
		$loginForm.submit( function() {
			if ($username.val() == "") {
				$resultMessage.attr("class","alert alert-error alert-login");
				$resultMessage.text("<%=SpringUtils.getMessage("admin.login.usernameRequired")%>");
				return false;
			}
			if ($password.val() == "") {
				$resultMessage.attr("class","alert alert-error alert-login");
				$resultMessage.text("<%=SpringUtils.getMessage("admin.login.passwordRequired")%>");
				return false;
			}
			if ($captcha.val() == "") {
				$resultMessage.attr("class","alert alert-error alert-login");
				$resultMessage.text("<%=SpringUtils.getMessage("admin.login.captchaRequired")%>");
				return false;
			}
			
			if ($isRememberUsername.prop("checked")) {
				addCookie("adminUsername", $username.val(), {expires: 7 * 24 * 60 * 60});
			} else {
				removeCookie("adminUsername");
			}
			
			var rsaKey = new RSAKey();
			rsaKey.setPublic(b64tohex("<%=modulus%>"), b64tohex("<%=exponent%>"));
			var enPassword = hex2b64(rsaKey.encrypt($password.val()));
			$enPassword.val(enPassword);
		});
		
		<%if (message != null) {%>
			$resultMessage.attr("class","alert alert-error alert-login");
			//alert(message);
			//alert(loginFailure);
			$resultMessage.text("<%=SpringUtils.getMessage(message, setting.getAccountLockCount())%>");
		<%}%>
	});
</script>
<%} else {%>
<title>提示信息 - Powered By SHOP++</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="<%=base%>/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=base%>/resources/admin/css/login.css" rel="stylesheet" type="text/css" />
<%}%>
</head>
<body>
	<%if (applicationContext != null) {%>
		<div class="login_box">
			<form id="loginForm" action="login.jsp" method="post">
				<input type="hidden" id="enPassword" name="enPassword" />
				<%if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.adminLogin)) {%>
					<input type="hidden" name="captchaId" value="<%=captchaId%>" />
				<%}%>
				
				<div class="top_b">definedweek 用户登录</div>
				
				<div class="alert alert-info alert-login" id="resultMessage">
					欢迎使用definedweek后台管理系统.
				</div>
				
				<div class="cnt_b">
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span>
							<input type="text" id="username" name="username" placeholder="Username" value="admin" maxlength="20" />
						</div>
					</div>
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span>
							<input type="password" id="password" placeholder="Password" value="admin" maxlength="20" autocomplete="off" />
						</div>
					</div>
					<%if (ArrayUtils.contains(setting.getCaptchaTypes(), CaptchaType.adminLogin)) {%>
						<div class="formRow">
							<div class="input-prepend">
								<input type="text" id="captcha" name="captcha" class="text captcha" style="width:150px;margin-right:3px;" maxlength="4" autocomplete="off" />
								<img id="captchaImage" class="captchaImage" src="<%=base%>/admin/common/captcha.jhtml?captchaId=<%=captchaId%>" title="<%=SpringUtils.getMessage("admin.captcha.imageTitle")%>" />
							</div>
						</div>
					<%}%>
					<div class="formRow clearfix">
						<label class="checkbox">
							<input type="checkbox" id="isRememberUsername" value="true" />
							<%=SpringUtils.getMessage("admin.login.rememberUsername")%>
						</label>
					</div>
				</div>
				<div class="btm_b clearfix">
					<button class="btn btn-inverse pull-right" type="submit" >登录</button>
					<!--  <span class="link_reg"><a href="#reg_form">Not registered? Sign up here</a></span>  -->
					<span class="link_reg"><a href="#">联系方式：xxxxxx</a></span>
				</div>  
			</form>
		</div>
	<%} else {%>
		<fieldset>
			<legend>系统出现异常</legend>
			<p>请检查SHOP++程序是否已正确安装 [<a href="<%=base%>/install/">点击此处进行安装</a>]</p>
			<p>
				<strong>提示: SHOP++安装完成后必须重新启动WEB服务器</strong>
			</p>
		</fieldset>
	<%}%>
	
		<script src="<%=base%>/resources/admin/js/jquery.min.js" ></script>
        <script src="<%=base%>/resources/admin/js/jquery.actual.min.js" ></script>
        <script src="<%=base%>/resources/admin/lib/validation/jquery.validate.js" ></script>
		<script src="<%=base%>/resources/admin/bootstrap/js/bootstrap.min.js" ></script>
        <script>
            $(document).ready(function(){
                
				//* boxes animation
				form_wrapper = $('.login_box');
				function boxHeight() {
					form_wrapper.animate({ marginTop : ( - ( form_wrapper.height() / 2) - 24) },400);	
				};
				form_wrapper.css({ marginTop : ( - ( form_wrapper.height() / 2) - 24) });
                $('.linkform a,.link_reg a').on('click',function(e){
					var target	= $(this).attr('href'),
						target_height = $(target).actual('height');
					$(form_wrapper).css({
						'height'		: form_wrapper.height()
					});	
					$(form_wrapper.find('form:visible')).fadeOut(400,function(){
						form_wrapper.stop().animate({
                            height	 : target_height,
							marginTop: ( - (target_height/2) - 24)
                        },500,function(){
                            $(target).fadeIn(400);
                            $('.links_btm .linkform').toggle();
							$(form_wrapper).css({
								'height'		: ''
							});	
                        });
					});
					e.preventDefault();
				});
            });
        </script>
		
		<script type="text/javascript">

			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-32339645-1']);
			_gaq.push(['_trackPageview']);
		  
			(function() {
			  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
		  
		  </script>
</body>
</html>