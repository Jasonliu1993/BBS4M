package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.entities.UserAttribute;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.forum.services.RelatedForumService;
import com.bbs4m.utilities.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

        modelMap.addAttribute("coreList",homePageService.getHomePageList(1,num,null));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(1,num, "theme",null));
        modelMap.addAttribute("currentPage", "1");

        return "/forum-page/forum-index.jsp";
    }

    @RequestMapping("/fourmDetail.do")
    public String getForumDetail ( @RequestParam("id") String id, HttpSession session, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        String followedButtonFlag = "N";
        String followedThemeButtonFlag = "N";
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            followedButtonFlag = getForumDetailService.getFollowedButtonFlag(((UserAttribute)session.getAttribute("UserAttr")).getUserid(),getForumDetailService.getCoreThemeAndContentByThemeId(id).getCreater());
            followedThemeButtonFlag = getForumDetailService.getFollowedThemeButtonFlag(((UserAttribute)session.getAttribute("UserAttr")).getUserid(),id);
            System.out.println("+++++" + num);
        }
            System.out.println("************" + followedButtonFlag);
        modelMap.addAttribute("coreForumTheme",getForumDetailService.getCoreThemeAndContentByThemeId(id));
        modelMap.addAttribute("replyForumContents",getForumDetailService.getReplyContentByThemeId(id,1,num));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(1,num, "content", id));
        modelMap.addAttribute("currentPage", "1");
        modelMap.addAttribute("relatedForum", relatedForumService.getRelatedForum(id));
        modelMap.addAttribute("followedButtonFlag",followedButtonFlag);
        modelMap.addAttribute("followedThemeButtonFlag",followedThemeButtonFlag);
        getForumDetailService.updateBrowse(id);
        return "/forum-page/forum-detail.jsp";
    }

    @RequestMapping("/fourmDetailByPilot.do")
    public String getForumDetailByPilot ( @RequestParam("id") String id, String currentPage, HttpSession session, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        String followedButtonFlag = "N";
        String followedThemeButtonFlag = "N";
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            followedButtonFlag = getForumDetailService.getFollowedButtonFlag(((UserAttribute)session.getAttribute("UserAttr")).getUserid(),getForumDetailService.getCoreThemeAndContentByThemeId(id).getCreater());
            followedThemeButtonFlag = getForumDetailService.getFollowedThemeButtonFlag(((UserAttribute)session.getAttribute("UserAttr")).getUserid(),id);
            System.out.println("+++++" + num);
        }

        modelMap.addAttribute("coreForumTheme",getForumDetailService.getCoreThemeAndContentByThemeId(id));
        modelMap.addAttribute("replyForumContents",getForumDetailService.getReplyContentByThemeId(id,Integer.parseInt(currentPage) + 1, num));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(Integer.parseInt(currentPage) + 1,num, "content", id));
        modelMap.addAttribute("currentPage", (Integer.parseInt(currentPage) + 1));
        modelMap.addAttribute("relatedForum", relatedForumService.getRelatedForum(id));
        modelMap.addAttribute("followedButtonFlag",followedButtonFlag);
        modelMap.addAttribute("followedThemeButtonFlag",followedThemeButtonFlag);
        return "/forum-page/forum-detail.jsp";
    }

    @RequestMapping("/replyTheme.do")
    public String replyTheme (HttpSession session,String themeId, String followThemeButton, String anonymitye, String replyDetail, @RequestParam("uploadPic") MultipartFile file) {
        getForumDetailService.saveNewContent(session, themeId, replyDetail, file, followThemeButton, anonymitye);
        System.out.println("followThemeButton:" + followThemeButton);
        System.out.println("anonymitye:" + anonymitye);
        return "/forum/fourmDetail.do?id=" + themeId;
    }

    @RequestMapping("/forumPost.do")
    String forumPost(HttpSession session) {
        return "/forum-page/forum-posted.jsp";
    }
}
