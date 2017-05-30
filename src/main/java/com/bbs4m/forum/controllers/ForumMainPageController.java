package com.bbs4m.forum.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 30/05/2017.
 */
@Controller
@RequestMapping("/forum")
public class ForumMainPageController {



    @RequestMapping("/mainPage")
    public String mainPage() {

        return "index.jsp";
    }
}
