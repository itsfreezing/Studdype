package com.studdype.test.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	private Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {//실행 이전
		logger.info("[Interceptor]:prehandle");
		
		if(request.getRequestURI().contains("/loginPage.do")|| 
			request.getRequestURI().contains("/ajaxlogin.do")||
			request.getSession().getAttribute("login")!=null) {
				return true;
		}
		
		if(request.getSession().getAttribute("login")==null) {
			response.sendRedirect("loginPage.do");
			return false;
		}
		
		
		return false;//controller로 넘어가지 않음 true일 경우 controller로 넘어감 
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	//응답처리 되기 전
		logger.info("[Interceptor]:postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//view까지 처리된 이후에 처리 
		logger.info("[Interceptor]: afterCompletion");
	}
	
	
	
	
}
