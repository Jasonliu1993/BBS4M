package com.bbs4m.forum.controllers;

import com.bbs4m.forum.entities.ForumTheme;
import com.bbs4m.forum.entities.ForumTopic;
import com.bbs4m.forum.entities.UserAttribute;
import com.bbs4m.forum.services.PagingService;
import com.bbs4m.forum.services.SearchService;
import com.bbs4m.utilities.DefaultValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Jason on 12/07/2017.
 */
@Controller
public class SearchController {

    @Resource
    SearchService searchService;

    @Resource
    PagingService pagingService;

    @RequestMapping("/searchPage.do")
    String searchPage(HttpSession session) {
        return "redirect:/search-page.jsp";
    }

    @RequestMapping("/searchResult.do")
    String searchResult(HttpSession session, String searchContent, String searchList, ModelMap modelMap) {
        modelMap.addAttribute("type",searchList);
        modelMap.addAttribute("currentPage", "1");
        modelMap.addAttribute("searchContent", searchContent);
        System.out.println(searchList);
        System.out.println(searchContent);
        if("searchForum".equals(searchList)) {
            modelMap.addAttribute("model",searchService.getSearchForum(searchContent,1, DefaultValue.getDefSearchRow()));
            modelMap.addAttribute("pagingFlag", pagingService.judgeLoadButton(1, DefaultValue.getDefSearchRow(), "searchForum", searchContent));
        } else if ("searchTopic".equals(searchList)) {
            modelMap.addAttribute("model",searchService.getSearchTopic(searchContent,1, DefaultValue.getDefSearchRow()));
            modelMap.addAttribute("pagingFlag", pagingService.judgeLoadButton(1, DefaultValue.getDefSearchRow(), "searchTopic", searchContent));
        } else {
            modelMap.addAttribute("model",searchService.getSearchPerson(searchContent,1, DefaultValue.getDefSearchRow()));
            modelMap.addAttribute("pagingFlag", pagingService.judgeLoadButton(1, DefaultValue.getDefSearchRow(), "searchPerson", searchContent));
        }
        return "/search-page.jsp";
    }
}
