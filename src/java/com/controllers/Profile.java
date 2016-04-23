package com.controllers;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Profile {

    private Model model;
    private HttpServletRequest request;
    private String sql;
    private UserInformation userInformation;
    private final ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            if (this.request.getSession().getAttribute("userInformation") == null) {

                return "index";
            } else {

                return "profile";
            }
        } catch (Exception e) {

            return "index";
        }
    }

    @RequestMapping(value = "change_password", method = RequestMethod.GET)
    protected String doGet1(Model model, HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            if (this.request.getSession().getAttribute("userInformation") != null) {

                return "change_password";
            }

            return "index";
        } catch (Exception e) {

            return "index";
        }
    }

    @RequestMapping(value = "change_password", method = RequestMethod.POST)
    protected String doPost(Model model, HttpServletRequest request,
            @RequestParam(value = "oldPassword", defaultValue = "") String oldPassword,
            @RequestParam(value = "newPassword", defaultValue = "") String newPassword) {

        this.model = model;
        this.request = request;

        try {
            
            this.userInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

            if (this.userInformation != null) {

                this.sql = "UPDATE user_info SET password = '"
                        + newPassword
                        + "' WHERE u_id = '"
                        + this.userInformation.getU_id()
                        + "' AND password='"
                        + oldPassword
                        + "' ";

                try {

                    this.connectToDatabase.getResult(this.sql);
                } catch (Exception e) {

                    return "change_password";
                }

                return "index";
            }

            return "index";
        } catch (Exception e) {

            return "index";
        }
    }
}
