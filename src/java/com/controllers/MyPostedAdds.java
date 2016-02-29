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

@Controller
public class MyPostedAdds {

    @RequestMapping(value = "my_posted_adds", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request) {

        try {

            if (request.getSession().getAttribute("userInformation") == null) {

                return "index";
            } else {

                UserInformation userInformation = (UserInformation) request.getSession().getAttribute("userInformation");
                String sql = "SELECT * advertisement_info WHERE u_id='"
                        + userInformation.getU_id() + "' ORDER BY post_id DESC";
                
                ConnectToDatabase connectToDatabase = (ConnectToDatabase)GetBeans.getBean("connectToDatabase");
                ResultSet resultSet = connectToDatabase.getResult(sql);
                
                model.addAttribute("resultSet", resultSet);
                String i = "0+";
                while(resultSet.next()){
                    i = i+"  "+resultSet.getInt("post_id");
                }
                model.addAttribute("errorMessage", connectToDatabase.getExpections().toString());//connectToDatabase.getExpections().toString()
                return "my_posted_adds";
            }
        } catch (Exception e) {

            return "index";
        }
    }
}
