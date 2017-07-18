package com.bbs4m.forum.controllers;

import com.bbs4m.forum.services.AdminService;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.utilities.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 24/06/2017.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    AdminService adminService;

    @Resource
    PagingService pagingService;

    @RequestMapping("/userInfo.do")
    public String getUserInfo (String id) {
        return "/admin-page/admin-main.jsp";
    }

    @RequestMapping("/personalDetail.do")
    public String getPersonalDetail (HttpSession session, String id, ModelMap modelMap) {

        int pageCount = DefaultValue.getDefSearchRow();

        modelMap.addAttribute("userDescr", adminService.getUserAttribute(id));



        modelMap.addAttribute("sendForumTheme", adminService.getSendForumTheme(id,1,pageCount));
        modelMap.addAttribute("forumCurrentPageingFlag", pagingService.judgeLoadButton(1, pageCount, "sendForumTheme", id));
        modelMap.addAttribute("forumCurrentPage", "1");

        modelMap.addAttribute("followedInfo",adminService.getFollowedUserByUserId(id));
        modelMap.addAttribute("personalInfo", adminService.getPersonalInfo(id));
        return "/admin-page/personal-page.jsp";
    }
}
