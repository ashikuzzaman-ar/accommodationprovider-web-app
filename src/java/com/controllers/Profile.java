package com.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Profile {

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request) {

        try {

            if (request.getSession().getAttribute("userInformation") == null) {

                return "index";
            } else {

                return "profile";
            }
        } catch (Exception e) {

            return "index";
        }
    }
}
