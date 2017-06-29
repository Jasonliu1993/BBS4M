package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.forum.services.RelatedForumService;
import com.bbs4m.utilities.DefaultValue;
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

    @Resource
    PagingService pagingService;

    @Resource
    RelatedForumService relatedForumService;

    @RequestMapping("/mainPage.do")
    public String mainPage(HttpSession session, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }

        modelMap.addAttribute("coreList",homePageService.getHomePageList(1,num));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(1,num, "theme",null));
        modelMap.addAttribute("currentPage", "1");

        return "/forum-page/forum-index.jsp";
    }

    @RequestMapping("/fourmDetail.do")
    public String getForumDetail ( @RequestParam("id") String id, HttpSession session, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }

        modelMap.addAttribute("coreForumTheme",getForumDetailService.getCoreThemeAndContentByThemeId(id));
        modelMap.addAttribute("replyForumContents",getForumDetailService.getReplyContentByThemeId(id,1,num));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(1,num, "content", id));
        modelMap.addAttribute("currentPage", "1");
        modelMap.addAttribute("relatedForum", relatedForumService.getRelatedForum(id));
        getForumDetailService.updateBrowse(id);
        return "/forum-page/forum-detail.jsp";
    }

    @RequestMapping("/fourmDetailByPilot.do")
    public String getForumDetailByPilot ( @RequestParam("id") String id, String currentPage, HttpSession session, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }

        modelMap.addAttribute("coreForumTheme",getForumDetailService.getCoreThemeAndContentByThemeId(id));
        modelMap.addAttribute("replyForumContents",getForumDetailService.getReplyContentByThemeId(id,1,(Integer.parseInt(currentPage) + 1) * num));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(Integer.parseInt(currentPage),num, "content", id));
        modelMap.addAttribute("currentPage", (Integer.parseInt(currentPage) + 1));
        modelMap.addAttribute("relatedForum", relatedForumService.getRelatedForum(id));
        return "/forum-page/forum-detail.jsp";
    }

    @RequestMapping("/replyTheme.do")
    public String replyTheme () {
        return "";
    }
}
