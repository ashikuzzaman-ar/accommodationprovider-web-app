package com.controllers;

import com.models.AdvertisementModel;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PostAdd {

    private Model model;
    private HttpServletRequest request;
    private UserInformation userInformation;
    private final ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
    private String sql;
    private ResultSet resultSet;

    @RequestMapping(value = "post_add", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request) {

        this.model = model;
        this.request = request;
        this.userInformation = (UserInformation) this.request.getSession().getAttribute("userInformation");

        try {

            if (this.userInformation == null) {

                return "index";
            } else {

                return "post_add";
            }
        } catch (Exception e) {

            this.model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    @RequestMapping(value = "post_add", method = RequestMethod.POST)
    protected String doPost(Model model,
            HttpServletRequest request,
            @ModelAttribute("advertisementModel") AdvertisementModel advertisementModel,
            BindingResult postAddBindingResult) {

        this.model = model;
        this.request = request;
        this.userInformation = (UserInformation) request.getSession().getAttribute("userInformation");

        try {

            if (this.userInformation == null) {

                return "index";
            } else if (postAddBindingResult.hasErrors()) {

                this.model.addAttribute("errorMessage", postAddBindingResult.getAllErrors().toString());

                return "index";
            } else {

                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Date date = new Date();

                this.sql = "INSERT INTO advertisement_info (u_id, title, address, type, quantity, "
                        + "deadline, availability, house_rent, utility_cost, provided_fasility, "
                        + "post_date) VALUES ("
                        + "'" + advertisementModel.getPosterID() + "', "
                        + "'" + advertisementModel.getTitle() + "', "
                        + "'" + advertisementModel.getAdress() + "', "
                        + "'" + advertisementModel.getType() + "', "
                        + "'" + advertisementModel.getVacancy() + "', "
                        + "'" + advertisementModel.getDeadline() + "', "
                        + "'" + "Y" + "', "
                        + "'" + advertisementModel.getRent() + "', "
                        + "'" + advertisementModel.getUtility() + "', "
                        + "'" + advertisementModel.getFacility() + "', "
                        + "'" + dateFormat.format(date) + "'"
                        + ")";

                this.connectToDatabase.getResult(this.sql);

                this.sql = "SELECT * FROM advertisement_info WHERE u_id='"
                        + advertisementModel.getPosterID()
                        + "' ORDER BY post_id DESC";

                this.resultSet = this.connectToDatabase.getResult(sql);
                this.model.addAttribute("resultSet", this.resultSet);

                return "my_posted_adds";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    @RequestMapping(value = "update_add", method = RequestMethod.POST)
    protected String doPost1(Model model,
            HttpServletRequest request,
            @RequestParam(value = "availability", defaultValue = "Y") String availability,
            @RequestParam(value = "postID") String postID) {

        this.model = model;
        this.request = request;
        this.userInformation = (UserInformation) request.getSession().getAttribute("userInformation");

        try {

            if (this.userInformation == null) {

                return "index";
            } else {

                this.sql = "UPDATE advertisement_info SET "
                        + "availability = '" + "Y" + "' "
                        + "WHERE post_id = " + Integer.parseInt(postID);

                this.connectToDatabase.getResult(this.sql);

                this.sql = "SELECT * FROM advertisement_info WHERE u_id='"
                        + this.userInformation.getU_id()
                        + "' ORDER BY post_id DESC";

                this.resultSet = this.connectToDatabase.getResult(sql);
                this.model.addAttribute("resultSet", this.resultSet);

                return "my_posted_adds";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }
}
