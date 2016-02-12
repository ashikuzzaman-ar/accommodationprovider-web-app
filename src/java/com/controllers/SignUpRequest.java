package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignUpRequest {

    @RequestMapping(value = "signup", method = RequestMethod.GET)
    public String doGet(Model model) {
        try {
            return "signup";
        } catch (Exception e) {
            return "index";
        }
    }

}
