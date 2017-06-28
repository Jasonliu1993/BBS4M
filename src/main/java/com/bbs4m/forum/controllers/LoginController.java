package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.UserData;
import com.bbs4m.forum.services.LoginService;
import com.bbs4m.forum.services.PersonalInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 24/06/2017.
 */
@Controller
public class LoginController {

    @Resource
    LoginService loginService;

    @Resource
    PersonalInfoService personalInfoService;

    @RequestMapping("/login.do")
    public String login (String userId, String password, HttpSession session, ModelMap modelMap) {
        System.out.println("+++++++" + userId);

        UserData userData = loginService.getAccess(userId, password);

        if (userData != null) {
            session.setAttribute("PersonalSetup",personalInfoService.getPersonalSetupByUserId(userData.getUserid()));
            session.setAttribute("UserAttr",personalInfoService.getUserAttrByUserId(userData.getUserid()));
            return "redirect:/forum/mainPage.do";
        } else {
            modelMap.addAttribute("errorMsg","用户名或密码错误");
            return "/login/login-page.jsp";
        }
    }
}
