package com.bbs4m.forum.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 24/06/2017.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/userInfo.do")
    public String getUserInfo (String id) {
        return "/admin-page/admin-main.jsp";
    }

    @RequestMapping("/personalDetail.do")
    public String getPersonalDetail (HttpSession session, String id) {
        return "/admin-page/personal-page.jsp";
    }
}
