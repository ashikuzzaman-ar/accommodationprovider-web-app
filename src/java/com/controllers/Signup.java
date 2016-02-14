package com.controllers;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Signup {

    @RequestMapping(value = "signup", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request) {

        try {

            model.addAttribute("indexPageVisibility", "");
            model.addAttribute("signupPageVisibility", "active");
            return "signup";
        } catch (Exception e) {

            model.addAttribute("indexPageVisibility", "");
            model.addAttribute("signupPageVisibility", "active");
            return "index";
        }
    }

    @RequestMapping(value = "signup", method = RequestMethod.POST)
    protected String doPost(Model model,
            @ModelAttribute UserInformation userInformation,
            BindingResult userInformationResult) {

        try {

            if (!userInformationResult.hasErrors()) {

                String sql = "INSERT INTO user_info (u_id, name, password, email, contact_num, "
                        + "gender) VALUES ("
                        + "'" + userInformation.getU_id() + "', "
                        + "'" + userInformation.getName() + "', "
                        + "'" + userInformation.getPassword() + "', "
                        + "'" + userInformation.getEmail() + "', "
                        + "'" + userInformation.getContact_num() + "', "
                        + "'" + userInformation.getGender() + "'"
                        + ")";
                
                ConnectToDatabase connectToDatabase = (ConnectToDatabase)GetBeans.getBean("connectToDatabase");
                connectToDatabase.getResult(sql);
                userInformation.setNull();
                model.addAttribute("errorMessage", "Now Login please!");
            } else {

                model.addAttribute("errorMessage", userInformationResult.getAllErrors().toString());
            }
            return "index";
        } catch (Exception e) {

            return "index";
        }
    }
}
