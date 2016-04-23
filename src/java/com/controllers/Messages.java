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

    private String sql;
    private HttpServletRequest request;
    private Model model;
    private UserInformation userInformation;
    private final ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
    private ResultSet resultSet;
    private String receiverID;

    @RequestMapping(value = "messages", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request) {

        this.request = request;
        this.model = model;

        try {

            this.userInformation = (UserInformation) request.getSession().getAttribute("userInformation");

            if (this.userInformation != null) {

                this.sql = "SELECT * FROM messages, user_info WHERE (receiver_id='"
                        + this.userInformation.getU_id()
                        + "' AND messages.sender_id=user_info.u_id)";

                this.resultSet = this.connectToDatabase.getResult(this.sql);
                this.model.addAttribute("inboxMessages", this.resultSet);

                this.sql = "SELECT * FROM messages, user_info WHERE (sender_id='"
                        + this.userInformation.getU_id()
                        + "' AND messages.receiver_id=user_info.u_id)";

                this.resultSet = this.connectToDatabase.getResult(this.sql);
                model.addAttribute("outboxMessages", this.resultSet);

                return "messages";
            } else {

                return "index";
            }
        } catch (Exception e) {

            return null;
        }
    }

    @RequestMapping(value = "messages", method = RequestMethod.POST)
    protected String doPost(Model model, HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            return "index";
        } catch (Exception e) {

            return "index";
        }
    }

    @RequestMapping(value = "send_message", method = RequestMethod.POST)
    protected String doPost2(Model model,
            HttpServletRequest request,
            @RequestParam(value = "message", defaultValue = "") String message,
            @RequestParam(value = "receiverID", defaultValue = "") String receiverID) {

        this.request = request;
        this.model = model;
        this.receiverID = receiverID;

        try {

            this.userInformation = (UserInformation) request.getSession().getAttribute("userInformation");

            DateFormat dateFormat = new SimpleDateFormat();
            Date date = new Date();

            this.sql = "SELECT * FROM messages WHERE (sender_id='"
                    + this.userInformation.getU_id()
                    + "' AND receiver_id='"
                    + this.receiverID
                    + "')";

            this.resultSet = this.connectToDatabase.getResult(this.sql);

            if (this.resultSet.next()) {

                message = (String) dateFormat.format(date) + "##@@!#@#" + message
                        + "##@@!!#@#" + this.resultSet.getString("messages_text");

                this.sql = "UPDATE messages SET messages_text='"
                        + message
                        + "', last_edited='"
                        + dateFormat.format(date)
                        + "', seen='N' WHERE (sender_id='"
                        + this.userInformation.getU_id()
                        + "' AND receiver_id='"
                        + this.receiverID
                        + "')";
            } else {

                message = (String) dateFormat.format(date) + "##@@!#@#" + message + "##@@!!#@#";
                this.sql = "INSERT INTO messages (sender_id, receiver_id, seen, last_edited, messages_text) "
                        + "VALUES ('"
                        + this.userInformation.getU_id() + "', '"
                        + this.receiverID + "', '"
                        + "N', '"
                        + dateFormat.format(date) + "', '"
                        + message + "')";
            }

            this.connectToDatabase.getResult(this.sql);

            model.addAttribute("resultSet", this.getResultSet(0, 6));
            return "index";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    private ResultSet getResultSet(int startLimit, int endLimit) {

        try {

            this.sql = "SELECT * FROM advertisement_info, user_info WHERE "
                    + "(advertisement_info.u_id!='"
                    + this.userInformation.getU_id()
                    + "' AND advertisement_info.u_id ="
                    + "user_info.u_id AND user_info.gender='"
                    + this.userInformation.getGender()
                    + "') ORDER BY post_id DESC limit "
                    + startLimit + ", " + endLimit;

            return this.connectToDatabase.getResult(this.sql);
        } catch (Exception e) {

            return null;
        }
    }
}
