package com.controllers;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Index {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request) {

        try {

            model.addAttribute("indexPageVisibility", "active");
            model.addAttribute("signupPageVisibility", "");
            return "index";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            model.addAttribute("indexPageVisibility", "active");
            model.addAttribute("signupPageVisibility", "");
            return "index";
        }
    }

    @RequestMapping(value = "index", method = RequestMethod.POST)
    protected String doPost(Model model,
            @RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password,
            HttpServletRequest request) {

        try {

            if (this.isValid(username, password, request, model)) {

                model.addAttribute("errorMessage", "");
                model.addAttribute("indexPageVisibility", "active");
                model.addAttribute("signupPageVisibility", "");
                return "index";
            } else {

                model.addAttribute("indexPageVisibility", "active");
                model.addAttribute("signupPageVisibility", "");
                return "index";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            model.addAttribute("indexPageVisibility", "active");
            model.addAttribute("signupPageVisibility", "");
            return "index";
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    protected String doGet2(Model model, HttpServletRequest request) {

        try {

            request.getSession().setAttribute("userInformation", null);
            model.addAttribute("indexPageVisibility", "active");
            model.addAttribute("signupPageVisibility", "");
            return "index";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            model.addAttribute("indexPageVisibility", "active");
            model.addAttribute("signupPageVisibility", "");
            return "index";
        }
    }

    private boolean isValid(String username, String password, HttpServletRequest request, Model model) {

        try {

            if (!("".equals(username.trim())) && !("".equals(password.trim()))) {

                String sql = "SELECT * FROM user_info WHERE u_id = "
                        + "'" + username + "' AND password = '" + password + "'";
                ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
                ResultSet resultSet = connectToDatabase.getResult(sql);

                if (resultSet.next()) {

                    UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

                    userInformation.setU_id(resultSet.getString("u_id"));
                    userInformation.setName(resultSet.getString("name"));
                    userInformation.setPassword(resultSet.getString("password"));
                    userInformation.setEmail(resultSet.getString("email"));
                    userInformation.setContact_num(resultSet.getString("contact_num"));
                    userInformation.setGender(resultSet.getString("gender"));

                    request.getSession().setAttribute("userInformation", userInformation);
                    model.addAttribute("errorMessage", "");
                    return true;
                } else {

                    request.getSession().setAttribute("userInformation", null);
                    model.addAttribute("errorMessage", "Username or Password does not match!");
                    return false;
                }

            } else {

                request.getSession().setAttribute("userInformation", null);
                model.addAttribute("errorMessage", "Username or Password is empty or containing white spaces!");
                return false;
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            request.getSession().setAttribute("userInformation", null);
            return false;
        }
    }
}
