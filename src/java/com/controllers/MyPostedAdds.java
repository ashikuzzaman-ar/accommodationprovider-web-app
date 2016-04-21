package com.controllers;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPostedAdds {

    @RequestMapping(value = "my_posted_adds", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request,
            HttpServletResponse response) {

        try {

            if (request.getSession().getAttribute("userInformation") == null) {

                return "index";
            } else {

                UserInformation userInformation = (UserInformation) request.getSession().getAttribute("userInformation");
                ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
                String sql = "SELECT * FROM advertisement_info WHERE u_id='"
                        + userInformation.getU_id()
                        + "' ORDER BY post_id DESC";

                model.addAttribute("resultSet", connectToDatabase.getResult(sql));

                return "my_posted_adds";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e);
            return "index";
        }
    }
}
