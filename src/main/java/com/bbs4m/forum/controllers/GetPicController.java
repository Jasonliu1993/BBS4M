package com.bbs4m.forum.controllers;

import com.bbs4m.forum.services.GetAvatorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;

/**
 * Created by Jason on 08/06/2017.
 */
@Controller
@RequestMapping("/images")
public class GetPicController {
    @Resource
    GetAvatorService getAvatorService;

    @RequestMapping("/getAvator.do")
    @ResponseBody
    public void getAvator(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("before");
        try {
            OutputStream os = null;

            os = response.getOutputStream();
            int count = 0;
            byte[] buffer = getAvatorService.getAvatorByUserId(id);
            os.write(buffer);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("after");
    }
}
