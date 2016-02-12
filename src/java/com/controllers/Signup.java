package com.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Signup {

    @RequestMapping(value = "signup", method = RequestMethod.GET)
    public String doGet(Model model, HttpServletRequest request) {

        try {
            
            
            return "signup";
        } catch (Exception e) {

            return "index";
        }
    }

}
