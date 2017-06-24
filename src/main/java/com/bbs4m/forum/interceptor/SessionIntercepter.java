package com.bbs4m.forum.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Jason on 30/05/2017.
 */
public class SessionIntercepter implements HandlerInterceptor {

    List<String> allowUrl;

    public List<String> getAllowUrl() {
        return allowUrl;
    }

    public void setAllowUrl(List<String> allowUrl) {
        this.allowUrl = allowUrl;
    }

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        for (String url : allowUrl) {
            if (httpServletRequest.getRequestURL().toString().contains(url)) {
                HttpSession session = httpServletRequest.getSession();
                if (session.getAttribute("userName") != null) {
                    return true;
                } else {
                    httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login/login-page.jsp");
                    return false;
                }
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
