package com.bbs4m.forum.controllers;

import com.bbs4m.forum.services.PagingService;
import com.bbs4m.forum.services.TopicService;
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
    public String getTopicDetail(HttpSession session, String currentPage, ModelMap modelMap) {
        return "/topic-page/topic-detail.jsp";
    }

}
