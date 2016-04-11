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

@Controller
public class Index {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request) {

        try {

            if (request.getSession().getAttribute("userInformation") != null) {

                model.addAttribute("resultSet", this.getResultSet(0, 6));
                model.addAttribute("messageResultSet", this.getMessages());
                model.addAttribute("numberOfMessages", this.getMessageCount());
                
                return "home";
            }
//            model.addAttribute("indexPageVisibility", "active");
//            model.addAttribute("signupPageVisibility", "");
            return "index";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
//            model.addAttribute("indexPageVisibility", "active");
//            model.addAttribute("signupPageVisibility", "");
            return "index";
        }
    }

    @RequestMapping(value = "index", method = RequestMethod.POST)
    protected String doPost1(Model model,
            @RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password,
            HttpServletRequest request) {

        try {

            if (this.isValid(username, password, request, model)) {

                model.addAttribute("errorMessage", "");
//                model.addAttribute("indexPageVisibility", "active");
//                model.addAttribute("signupPageVisibility", "");

                model.addAttribute("resultSet", this.getResultSet(0, 6));
                model.addAttribute("messageResultSet", this.getMessages());
                model.addAttribute("numberOfMessages", this.getMessageCount());

                return "home";
            } else {

//                model.addAttribute("indexPageVisibility", "active");
//                model.addAttribute("signupPageVisibility", "");
                return "index";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
//            model.addAttribute("indexPageVisibility", "active");
//            model.addAttribute("signupPageVisibility", "");
            return "index";
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

                message = dateFormat.format(date) + "::[/])):" + message + "<%(#%#)*/*>" + resultSet.getString("messages_text");
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

                message = dateFormat.format(date) + "::[/])):" + message;
                sql = "INSERT INTO messages (sender_id, receiver_id, last_edited, messages_text) "
                        + "VALUES ('"
                        + userInformation.getU_id() + "', '"
                        + receiverID + "', '"
                        + dateFormat.format(date) + "', '"
                        + message + "')";
            }

            connectToDatabase.getResult(sql);

            model.addAttribute("resultSet", this.getResultSet(0, 6));
            return "home";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    private int getMessageCount() {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

            String sql = "SELECT COUNT(*) AS numbers FROM messages, user_info WHERE (receiver_id='"
                    + userInformation.getU_id()
                    + "' AND seen='N' AND messages.sender_id=user_info.u_id)";

            int numberOfMessages = 0;
            ResultSet resultSet = connectToDatabase.getResult(sql);

            if (resultSet.next()) {

                numberOfMessages = Integer.parseInt(resultSet.getString("numbers"));
            }

            return numberOfMessages;
        } catch (Exception e) {

            return 0;
        }
    }

    private ResultSet getMessages() {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

            String sql = "SELECT messages.sender_id, messages.receiver_id, user_info.name "
                    + "FROM messages, user_info WHERE (receiver_id='"
                    + userInformation.getU_id()
                    + "' AND seen='N' AND messages.sender_id=user_info.u_id) "
                    + "ORDER BY last_edited LIMIT 0,6";

            return connectToDatabase.getResult(sql);
        } catch (Exception e) {

            return null;
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

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    protected String doGet2(Model model, HttpServletRequest request) {

        try {

            request.getSession().setAttribute("userInformation", null);
//            model.addAttribute("indexPageVisibility", "active");
//            model.addAttribute("signupPageVisibility", "");
            return "index";
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
//            model.addAttribute("indexPageVisibility", "active");
//            model.addAttribute("signupPageVisibility", "");
            return "index";
        }
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    protected String doPost3(Model model,
            @RequestParam("search") String searchKey) {

        try {

            if (!searchKey.trim().equals("")) {

                model.addAttribute("searchResults", this.getSearchResult(model, searchKey));
                return "search_places";
            } else {

//                model.addAttribute("indexPageVisibility", "active");
//                model.addAttribute("signupPageVisibility", "");
                return "index";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
//            model.addAttribute("indexPageVisibility", "active");
//            model.addAttribute("signupPageVisibility", "");
            return "index";
        }
    }

    private ResultSet getSearchResult(Model model, String searchKey) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();

            String sql = "SELECT * FROM uiuap.advertisement_info WHERE ((advertisement_info.u_id!='"
                    + userInformation.getU_id()
                    + "' AND advertisement_info.availability='Y' AND advertisement_info.deadline>='"
                    + dateFormat.format(date)
                    + "' AND advertisement_info.u_id in ("
                    + "SELECT u_id FROM uiuap.user_info WHERE gender='"
                    + userInformation.getGender()
                    + "')) AND ("
                    + "advertisement_info.address LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.u_id LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.type LIKE '%" + searchKey + "%'"
                    + "))";
            return connectToDatabase.getResult(sql);
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return null;
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
