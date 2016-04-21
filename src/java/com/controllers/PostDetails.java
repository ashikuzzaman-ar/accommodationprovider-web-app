package com.controllers;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PostDetails {

    private HttpServletRequest request;
    @RequestMapping(value = "{post_id}", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request,
            @PathVariable(value = "post_id") int post_id) {

        UserInformation userInformation = (UserInformation) request.getSession().getAttribute("userInformation");

        try {

            if (userInformation != null) {

                model.addAttribute("resultSet", this.getResultSet(post_id, userInformation));
                return "post_details";
            }
            return "index";
        } catch (Exception e) {

            return "index";
        }
    }

    private ResultSet getResultSet(int postID, UserInformation userInformation) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            //UserInformation userInformation = (UserInformation) request.getSession().getAttribute("userInformation");

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();

            String sql = "SELECT * FROM uiuap.advertisement_info WHERE (advertisement_info.u_id!='"
                    + userInformation.getU_id()
                    + "' AND advertisement_info.availability='Y' AND advertisement_info.deadline>='"
                    + dateFormat.format(date)
                    + "' AND advertisement_info.post_id="
                    + postID
                    + " AND advertisement_info.u_id in ("
                    + "SELECT u_id FROM uiuap.user_info WHERE gender='"
                    + userInformation.getGender()
                    + "'))";

            return connectToDatabase.getResult(sql);
        } catch (Exception e) {

            return null;
        }
    }
}
