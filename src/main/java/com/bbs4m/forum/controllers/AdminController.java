package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.UserAttribute;
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

    @RequestMapping("/userMsg.do")
    public String getUserMsg (HttpSession session, ModelMap modelMap) {
        int pageCount = DefaultValue.getDefSearchRow();
        String userId = ((UserAttribute)session.getAttribute("UserAttr")).getUserid();

        modelMap.addAttribute("forumTheme", adminService.getForumFollow(userId,1,pageCount));
        modelMap.addAttribute("forumCurrentPageingFlag", pagingService.judgeLoadButton(1, pageCount, "ForumTheme", userId));
        modelMap.addAttribute("forumCurrentPage", "1");
        modelMap.addAttribute("pageFlag", "userMsg");


        return "/admin-page/user-message.jsp";
    }

    @RequestMapping("/userMsgNote.do")
    public String getUserMsgNote (HttpSession session, ModelMap modelMap) {

        modelMap.addAttribute("pageFlag", "userMsgNote");


        return "/admin-page/user-message.jsp";
    }

    @RequestMapping("/personalDetail.do")
    public String getPersonalDetail (HttpSession session, String id, ModelMap modelMap) {

        int pageCount = DefaultValue.getDefSearchRow();

        modelMap.addAttribute("userDescr", adminService.getUserAttribute(id));

        modelMap.addAttribute("forumJoinTheme", adminService.getForumJoin(id,1,pageCount));
        modelMap.addAttribute("forumJoinCurrentPageingFlag", pagingService.judgeLoadButton(1, pageCount, "ForumJoinTheme", id));
        modelMap.addAttribute("forumJoinCurrentPage", "1");

        modelMap.addAttribute("sendForumTheme", adminService.getSendForumTheme(id,1,pageCount));
        modelMap.addAttribute("forumCurrentPageingFlag", pagingService.judgeLoadButton(1, pageCount, "sendForumTheme", id));
        modelMap.addAttribute("forumCurrentPage", "1");

        modelMap.addAttribute("followedInfo",adminService.getFollowedUserByUserId(id));
        modelMap.addAttribute("personalInfo", adminService.getPersonalInfo(id));
        return "/admin-page/personal-page.jsp";
    }
}
