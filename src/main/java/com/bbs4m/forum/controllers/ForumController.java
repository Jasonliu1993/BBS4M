package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.forum.services.HomePageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 30/05/2017.
 */
@Controller
@RequestMapping("/forum")
public class ForumController {

    @Resource
    HomePageService homePageService;

    @Resource
    GetForumDetailService getForumDetailService;

    @RequestMapping("/mainPage")
    public String mainPage(HttpSession session, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = 10;
        if ( (userConfig = (PersonalSetup)session.getAttribute("userConfig")) != null) {
            num = (int)userConfig.getList_Count_In_Page();
        }

        modelMap.addAttribute("coreList",homePageService.getHomePageList(0,num));

        return "/forum-page/forum-index.jsp";
    }

    @RequestMapping("/fourmDetail.do")
    public String getForumDetail ( @RequestParam("id") String id, ModelMap modelMap) {
        modelMap.addAttribute("coreForumTheme",getForumDetailService.getCoreThemeAndContentByThemeId(id));
        modelMap.addAttribute("replyForumContents",getForumDetailService.getReplyContentByThemeId(id));
        return "/forum-page/forum-detail.jsp";
    }

    @RequestMapping("/replyTheme")
    public String replyTheme () {
        return "";
    }
}
