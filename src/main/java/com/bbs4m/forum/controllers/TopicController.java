package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.PersonalSetup;
import com.bbs4m.forum.services.HomePageService;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.forum.services.TopicService;
import com.bbs4m.utilities.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 03/07/2017.
 */
@Controller
@RequestMapping("/topic")
public class TopicController {

    @Resource
    TopicService topicService;

    @Resource
    PagingService pagingService;

    @Resource
    HomePageService homePageService;

    @RequestMapping("/topicIntro.do")
    public String getTopicIntro(HttpSession session, String currentPage, ModelMap modelMap) {
        int pageCount = 1;
        if (currentPage == null) {
            currentPage = "1";
        }
        modelMap.addAttribute("topicList", topicService.getForumTopicByPilot(Integer.parseInt(currentPage), pageCount));
        modelMap.addAttribute("nextpage", Integer.parseInt(currentPage) + 1);
        modelMap.addAttribute("pagingFlag", pagingService.judgeLoadButton(Integer.parseInt(currentPage), pageCount, "topic", null));
        return "/topic-page/topic-intro.jsp";
    }

    @RequestMapping("/topic-detail.do")
    public String getTopicDetail(HttpSession session, String id, String currentPage, ModelMap modelMap) {
        PersonalSetup userConfig = null;
        int num = DefaultValue.getDefTopicRow();

        modelMap.addAttribute("coreList",homePageService.getHomePageList(1 ,num,id));
        modelMap.addAttribute("pagingFlag",pagingService.judgeLoadButton(1,num, "topicForum",id));
        modelMap.addAttribute("currentPage", "1");
        modelMap.addAttribute("topic",topicService.getForumTopicById(id));

        return "/topic-page/topic-detail.jsp";
    }

}
