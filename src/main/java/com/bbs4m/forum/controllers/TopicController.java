package com.bbs4m.forum.controllers;

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

    @RequestMapping("/topicIntro.do")
    public String getTopicIntro(HttpSession session, String currentPage, ModelMap modelMap) {
        int pageCount = 10;
        if (currentPage == null) {
            modelMap.addAttribute("topicList",topicService.getForumTopicByPilot(1,pageCount ));
            modelMap.addAttribute("nextpage", 2);
        } else {
            modelMap.addAttribute("topicList",topicService.getForumTopicByPilot(Integer.parseInt(currentPage),pageCount ));
            modelMap.addAttribute("nextpage", Integer.parseInt(currentPage) + 1);
        }
        return "/topic-page/topic-intro.jsp";
    }

}
