/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ashik
 */
@Controller
public class Messages {

    @RequestMapping(value = "messages", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");
            String sql;

            if (request.getSession().getAttribute("userInformation") != null) {

                sql = "SELECT * FROM messages, user_info WHERE (receiver_id='"
                        + userInformation.getU_id() + "' AND messages.sender_id=user_info.u_id)";

                ResultSet resultSet1 = connectToDatabase.getResult(sql);
                model.addAttribute("inboxMessages", resultSet1);

                sql = "SELECT * FROM messages, user_info WHERE (sender_id='"
                        + userInformation.getU_id() + "' AND messages.receiver_id=user_info.u_id)";

                ResultSet resultSet2 = connectToDatabase.getResult(sql);
                model.addAttribute("outboxMessages", resultSet2);

                return "messages";
            } else {

                return "index";
            }
        } catch (Exception e) {

            return null;
        }
    }

    @RequestMapping(value = "messages", method = RequestMethod.POST)
    protected String doPost(Model model) {

        try {

            return null;
        } catch (Exception e) {

            return null;
        }
    }

    @RequestMapping(value = "send_message", method = RequestMethod.POST)
    protected String doPost2(Model model,
            @RequestParam(value = "message", defaultValue = "") String message,
            @RequestParam(value = "receiverID", defaultValue = "") String receiverID) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

            DateFormat dateFormat = new SimpleDateFormat();
            Date date = new Date();

            String sql = "SELECT * FROM messages WHERE (sender_id='"
                    + userInformation.getU_id()
                    + "' AND receiver_id='"
                    + receiverID
                    + "')";

            ResultSet resultSet = connectToDatabase.getResult(sql);

            if (resultSet.next()) {

                message = (String)dateFormat.format(date) + "##@@!#@#" + message + "##@@!!#@#" + resultSet.getString("messages_text");
                sql = "UPDATE messages SET messages_text='"
                        + message
                        + "', last_edited='"
                        + dateFormat.format(date)
                        + "', seen='N', WHERE sender_id='"
                        + userInformation.getU_id()
                        + "' AND receiver_id='"
                        + receiverID
                        + "'";
            } else {

                message = (String)dateFormat.format(date) + "##@@!#@#" + message;
                sql = "INSERT INTO messages (sender_id, receiver_id, last_edited, messages_text) "
                        + "VALUES ('"
                        + userInformation.getU_id() + "', '"
                        + receiverID + "', '"
                        + dateFormat.format(date) + "', '"
                        + message + "')";
            }

            connectToDatabase.getResult(sql);

            model.addAttribute("resultSet", this.getResultSet(0, 6));
            return "index";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    private ResultSet getResultSet(int startLimit, int endLimit) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

            String sql = "SELECT * FROM uiuap.advertisement_info WHERE (advertisement_info.u_id!='"
                    + userInformation.getU_id()
                    + "' AND advertisement_info.u_id in ("
                    + "SELECT u_id FROM uiuap.user_info WHERE gender='"
                    + userInformation.getGender()
                    + "')) ORDER BY post_id DESC limit "
                    + startLimit + ", " + endLimit;

            return connectToDatabase.getResult(sql);
        } catch (Exception e) {

            return null;
        }
    }
}