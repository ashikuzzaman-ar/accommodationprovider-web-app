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

    private Model model;
    private HttpServletRequest request;
    private final ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
    private String sql;

    @RequestMapping(value = "signup", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            return "signup";
        } catch (Exception e) {

            return "index";
        }
    }

    @RequestMapping(value = "signup", method = RequestMethod.POST)
    protected String doPost(Model model,
            @ModelAttribute UserInformation userInformation,
            BindingResult userInformationResult,
            HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            if (!userInformationResult.hasErrors()) {

                this.sql = "INSERT INTO user_info (u_id, name, password, email, contact_num, "
                        + "gender) VALUES ("
                        + "'" + userInformation.getU_id() + "', "
                        + "'" + userInformation.getName() + "', "
                        + "'" + userInformation.getPassword() + "', "
                        + "'" + userInformation.getEmail() + "', "
                        + "'" + userInformation.getContact_num() + "', "
                        + "'" + userInformation.getGender() + "'"
                        + ")";

                this.connectToDatabase.getResult(this.sql);
                userInformation.setNull();
                this.model.addAttribute("errorMessage", "Congratulation! Now Login please.");
            } else {

                this.model.addAttribute("errorMessage", userInformationResult.getAllErrors().toString());
            }
            return "index";
        } catch (Exception e) {

            return "index";
        }
    }

    @RequestMapping(value = "update_profile", method = RequestMethod.POST)
    protected String doPost1(Model model,
            @ModelAttribute UserInformation userInformation,
            BindingResult userInformationResult,
            HttpServletRequest request) {

        this.model = model;
        this.request = request;

        UserInformation presentUserInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

        try {

            boolean isValidUser = (presentUserInformation != null) && presentUserInformation.getU_id().equals(userInformation.getU_id());

            if (!userInformationResult.hasErrors() && isValidUser) {

                this.sql = "UPDATE user_info SET "
                        + "name = '" + userInformation.getName() + "', "
                        + "email = '" + userInformation.getEmail() + "', "
                        + "contact_num = '" + userInformation.getContact_num() + "' "
                        + "WHERE u_id = '" + userInformation.getU_id() + "'";

                this.connectToDatabase.getResult(this.sql);

                userInformation.setPassword(presentUserInformation.getPassword());

                this.request.getSession().setAttribute("userInformation", userInformation);
                presentUserInformation.setNull();
                
                this.model.addAttribute("errorMessage", "Successfully updated your profile!");
            } else {

                this.model.addAttribute("errorMessage", userInformationResult.getAllErrors().toString());
            }

            return "index";
        } catch (Exception e) {

            return "index";
        }
    }
}
