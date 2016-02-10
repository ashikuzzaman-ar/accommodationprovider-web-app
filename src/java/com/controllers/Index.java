package com.controllers;

import com.util.ConnectToDatabase;
import com.util.GetBeans;
import java.sql.ResultSet;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Index {
    
    @RequestMapping(value = "index", method = RequestMethod.GET)
    protected String doGet(Model model){
        
        try {
            
            ConnectToDatabase ct = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            ResultSet rs = ct.getResult("select * from bfs_data");
            model.addAttribute("rs", rs);
            
            return "index";
        } catch (Exception e) {
            
            return null;
        }
    }
}
