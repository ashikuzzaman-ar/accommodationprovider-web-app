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

    private Model model;
    private HttpServletRequest request;
    private String username;
    private String password;
    private String sql;
    private ResultSet resultSet;
    private final ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
    private UserInformation userInformation = new UserInformation();

    @RequestMapping(value = "index", method = RequestMethod.GET)
    protected String doGet(Model model, HttpServletRequest request) {

        this.model = model;
        this.request = request;

        this.request = request;
        try {

            this.userInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

            if (this.userInformation != null) {

                this.model.addAttribute("resultSet", this.getResultSet(0, 6));

                return "index";
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
            HttpServletRequest request) {

        this.model = model;
        this.request = request;
        this.username = username;
        this.password = password;

        try {

            if (this.isValid()) {

                this.model.addAttribute("errorMessage", "");

                this.model.addAttribute("resultSet", this.getResultSet(0, 6));

                return "index";
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

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    protected String doGet2(Model model, HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            this.request.getSession().setAttribute("userInformation", null);

            return "index";
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());

            return "index";
        }
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    protected String doGet1(Model model, HttpServletRequest request) {

        this.model = model;
        this.request = request;

        try {

            return "index";
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());

            return "index";
        }
    }
    
    
    
    @RequestMapping(value = "search", method = RequestMethod.POST)
    protected String doPost3(Model model,
            @RequestParam("search") String searchKey,
            HttpServletRequest request) {

        this.model = model;
        this.request = request;

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
            
            this.userInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

//            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//            Date date = new Date();

            this.sql = "SELECT * FROM uiuap.advertisement_info, user_info WHERE "
                    + "((advertisement_info.u_id!='"
                    + this.userInformation.getU_id()
                    + "' AND advertisement_info.availability='Y' "
                    
                    
//                    + "AND advertisement_info.deadline>='"
//                    + dateFormat.format(date)
                    + "AND advertisement_info.u_id ="
                    + "user_info.u_id AND user_info.gender='"
                    + this.userInformation.getGender()
                    + "') AND ("
                    + "advertisement_info.address LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.u_id LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.title LIKE '%" + searchKey + "%' OR "
                    + "user_info.name LIKE '%" + searchKey + "%' OR "
                    + "advertisement_info.type LIKE '%" + searchKey + "%' "
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
