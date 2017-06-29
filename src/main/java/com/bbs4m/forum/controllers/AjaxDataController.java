package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.*;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.utilities.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jason on 22/06/2017.
 */
@Controller
@RequestMapping("/ajax")
public class AjaxDataController {

    @Resource
    GetForumDetailService getForumDetailService;

    @Resource
    HomePageService homePageService;

    @Resource
    PagingService pagingService;

    @RequestMapping(value = "/replyContentList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumContentReply> getReplyContentList(String id) {
        return getForumDetailService.getReplyContentByContentId(id);
    }

    @RequestMapping(value = "/themeList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumTheme> getThemeList(HttpSession session, String currentPage) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }
        return homePageService.getHomePageList(Integer.parseInt(currentPage) ,num);
    }

    @RequestMapping(value = "/contentList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumContent> getContentList (HttpSession session, String currentPage, String themeId) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }
        return getForumDetailService.getReplyContentByThemeId(themeId, Integer.parseInt(currentPage) ,num);
    }

    @RequestMapping(value = "/getLoadButtonFlag.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String > getLoadButtonFlag(HttpSession session, String currentPage, String object,String Id) {
        Map<String ,String> map = new HashMap<String, String>();
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefThemeRow();
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }
         map.put("flag",pagingService.judgeLoadButton(Integer.parseInt(currentPage),num,object,Id));
        return map;
    }

    @RequestMapping(value = "/followUser.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String > followUser(String userId, String followedUser, String object,String Id) {
        Map<String ,String> map = new HashMap<String, String>();

        getForumDetailService.insertFollowUser(userId,followedUser);
        map.put("flag","Y");
        return map;
    }
}
