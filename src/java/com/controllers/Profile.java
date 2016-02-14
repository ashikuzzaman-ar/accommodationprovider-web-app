package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Profile {
    
    @RequestMapping(value = "profile", method = RequestMethod.GET)
    protected String doGet(Model model){
        
        try {
            
            return "profile";
        } catch (Exception e) {
            
            return "index";
        }
    }
}