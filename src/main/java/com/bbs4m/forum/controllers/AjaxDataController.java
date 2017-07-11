package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.*;
import com.bbs4m.forum.services.GetForumDetailService;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.forum.services.TopicService;
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

    @Resource
    TopicService topicService;

    @RequestMapping(value = "/replyContentList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumContentReply> getReplyContentList(String id) {
        List<ForumContentReply> forumContentReplies = getForumDetailService.getReplyContentByContentId(id);
        for (ForumContentReply forumContentReply : forumContentReplies) {
            forumContentReply.setCreateTime(forumContentReply.getCreateTime().substring(0,10));
        }
        return forumContentReplies;
    }

    @RequestMapping(value = "/themeList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumTheme> getThemeList(HttpSession session, String currentPage, String topicId) {
        PersonalSetup userConfig = null;
        int num = 0;
        if (topicId != null && (! "".equals(topicId))){
            num = DefaultValue.getDefTopicRow();
        } else {
            topicId = null;
            num = DefaultValue.getDefThemeRow();
        }
        if ( (userConfig = (PersonalSetup)session.getAttribute("PersonalSetup")) != null) {
            num = (int)userConfig.getListCountInPage();
            System.out.println("+++++" + num);
        }
        return homePageService.getHomePageList(Integer.parseInt(currentPage) ,num,topicId);
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
        int num = 0;
        if (Id != null){
            num = DefaultValue.getDefTopicRow();
        } else {
            num = DefaultValue.getDefThemeRow();
        }
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

    @RequestMapping(value = "/followTheme.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String > followTheme(String userId, String followedTheme, String object,String Id) {
        Map<String ,String> map = new HashMap<String, String>();

        getForumDetailService.insertFollowTheme(userId,followedTheme);
        map.put("flag","Y");
        return map;
    }

    @RequestMapping(value = "/setLikeAndDislike.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String > setLikeAndDislike(String flag, String forumContentId) {
        Map<String ,String> map = new HashMap<String, String>();

        if ("like".equals(flag)) {
            getForumDetailService.updateLikeCount(forumContentId);
            map.put("category","like");
        } else {
            getForumDetailService.updateDislikeCount(forumContentId);
            map.put("category","dislike");
        }
        map.put("flag","Y");
        return map;
    }

    @RequestMapping(value = "/replyContentReply.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String > replyContentReply(String currentUser, String contentId, String subPersonId,String replyContent) {
        Map<String ,String> map = new HashMap<String, String>();
        map = getForumDetailService.saveForumContentReply(currentUser,contentId,subPersonId,replyContent);
        map.put("flag","Y");
        return map;
    }

    @RequestMapping(value = "/topicList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumTopic> getTopicList (HttpSession session, String currentPage) {
        int pageCount = DefaultValue.getDefTopicRow();
        return topicService.getForumTopicByPilot(Integer.parseInt(currentPage) ,pageCount);
    }

    @RequestMapping(value = "/selectTopic.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumTopic> selectTopic (HttpSession session, String topicName) {
        return topicService.selectTopic(topicName);
    }
}
