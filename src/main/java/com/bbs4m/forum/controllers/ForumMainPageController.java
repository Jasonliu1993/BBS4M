package com.bbs4m.forum.controllers;

import com.bbs4m.forum.services.HomePageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 30/05/2017.
 */
@Controller
@RequestMapping("/forum")
public class ForumMainPageController {

    @Resource
    HomePageService homePageService;

    @RequestMapping("/mainPage")
    public String mainPage(HttpSession session, ModelMap modelMap) {
        modelMap.addAttribute("coreList",homePageService.getHomePageList(1,1));
        return "/forum-page/forum-index.jsp";
    }
}
