package com.controllers;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Index {

    private Model model;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private String username;
    private String password;
    private String sql;
    private ResultSet resultSet;
    private ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
    private UserInformation userInformation = new UserInformation();

    @RequestMapping(value = "index", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request, HttpServletResponse response) {

        this.model = model;
        this.request = request;
        this.response = response;

        try {

            this.userInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

            if (this.userInformation != null) {

                this.model.addAttribute("resultSet", this.getResultSet(0, 6));

                return "home";
            }

            return "index";
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());

            return "index";
        }
    }

    @RequestMapping(value = "index", method = RequestMethod.POST)
    protected String doPost1(Model model,
            @RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password,
            HttpServletRequest request,
            HttpServletResponse response) {

        this.model = model;
        this.request = request;
        this.response = response;
        this.username = username;
        this.password = password;

        try {

            if (this.isValid()) {

                this.model.addAttribute("errorMessage", "");

                this.model.addAttribute("resultSet", this.getResultSet(0, 6));

                return "home";
            } else {

                return "index";
            }
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    private ResultSet getResultSet(int startLimit, int endLimit) {

        try {

            this.userInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

            this.sql = "SELECT * FROM uiuap.advertisement_info WHERE (advertisement_info.u_id!='"
                    + this.userInformation.getU_id()
                    + "' AND advertisement_info.u_id in ("
                    + "SELECT u_id FROM uiuap.user_info WHERE gender='"
                    + this.userInformation.getGender()
                    + "')) ORDER BY post_id DESC limit "
                    + startLimit + ", " + endLimit;

            return this.connectToDatabase.getResult(this.sql);
        } catch (Exception e) {

            return null;
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    protected String doGet2(Model model, HttpServletRequest request, HttpServletResponse response) {

        this.model = model;
        this.request = request;
        this.response = response;

        try {

            this.request.getSession().setAttribute("userInformation", null);

            return "index";
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());

            return "index";
        }
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    protected String doPost3(Model model,
            @RequestParam("search") String searchKey,
            HttpServletRequest request,
            HttpServletResponse response) {

        this.model = model;
        this.request = request;
        this.response = response;

        try {

            if (!searchKey.trim().equals("")) {

                this.model.addAttribute("searchResults", this.getSearchResult(searchKey));

                return "search_places";
            } else {

                return "index";
            }
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());

            return "index";
        }
    }

    private ResultSet getSearchResult(String searchKey) {

        try {

            this.userInformation = (UserInformation)this.request.getSession().getAttribute("userInformation");

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();

            this.sql = "SELECT * FROM uiuap.advertisement_info WHERE ((advertisement_info.u_id!='"
                    + this.userInformation.getU_id()
                    + "' AND advertisement_info.availability='Y' AND advertisement_info.deadline>='"
                    + dateFormat.format(date)
                    + "' AND advertisement_info.u_id in ("
                    + "SELECT u_id FROM uiuap.user_info WHERE gender='"
                    + this.userInformation.getGender()
                    + "')) AND ("
                    + "advertisement_info.address LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.u_id LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.type LIKE '%" + searchKey + "%'"
                    + "))";
            return this.connectToDatabase.getResult(this.sql);
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());
            return null;
        }
    }

    private boolean isValid() {

        try {

            if (!("".equals(this.username.trim())) && !("".equals(this.password.trim()))) {

                this.sql = "SELECT * FROM user_info WHERE u_id = "
                        + "'" + this.username + "' AND password = '" + this.password + "'";

                this.resultSet = this.connectToDatabase.getResult(this.sql);

                if (this.resultSet.next()) {

                    this.userInformation = new UserInformation();

                    this.userInformation.setU_id(this.resultSet.getString("u_id"));
                    this.userInformation.setName(this.resultSet.getString("name"));
                    this.userInformation.setPassword(this.resultSet.getString("password"));
                    this.userInformation.setEmail(this.resultSet.getString("email"));
                    this.userInformation.setContact_num(this.resultSet.getString("contact_num"));
                    this.userInformation.setGender(this.resultSet.getString("gender"));

                    this.request.getSession().setAttribute("userInformation", this.userInformation);
                    this.model.addAttribute("errorMessage", "");
                    return true;
                } else {

                    this.request.getSession().setAttribute("userInformation", null);
                    this.model.addAttribute("errorMessage", "Username or Password does not match!");
                    return false;
                }

            } else {

                this.request.getSession().setAttribute("userInformation", null);
                this.model.addAttribute("errorMessage", "Username or Password is empty or containing white spaces!");
                return false;
            }
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());
            this.request.getSession().setAttribute("userInformation", null);
            return false;
        }
    }
}
