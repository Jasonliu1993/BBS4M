package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.ForumContentReply;
import com.bbs4m.forum.services.GetForumDetailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jason on 22/06/2017.
 */
@Controller
@RequestMapping("/ajax")
public class AjaxDataController {

    @Resource
    GetForumDetailService getForumDetailService;

    @RequestMapping(value = "/replyContentList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ForumContentReply> getReplyContentList(String id) {
        return getForumDetailService.getReplyContentByContentId(id);
    }
}
