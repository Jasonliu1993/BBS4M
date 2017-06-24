package com.bbs4m.forum.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Jason on 24/06/2017.
 */
@Controller
public class LoginController {

    @RequestMapping("/login.do")
    public String login (String uerId, String password, HttpSession session ) {
        String userId = (String)session.getAttribute("userId");
        if (userId != null) {
            return "";
        } else {
            return "";
        }
    }
}
