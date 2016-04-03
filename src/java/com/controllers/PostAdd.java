package com.controllers;

import com.models.AdvertisementModel;
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

@Controller
public class PostAdd {

    @RequestMapping(value = "post_add", method = RequestMethod.GET)
    protected String doGet(Model model,
            HttpServletRequest request) {

        try {

            if (request.getSession().getAttribute("userInformation") == null) {

                return "index";
            } else {
                
                return "post_add";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }

    @RequestMapping(value = "post_add", method = RequestMethod.POST)
    protected String doPost(Model model,
            HttpServletRequest request,
            @ModelAttribute("advertisementModel") AdvertisementModel advertisementModel,
            BindingResult postAddBindingResult) {

        try {

            if (request.getSession().getAttribute("userInformation") == null) {
                
                return "index";
            } else if (postAddBindingResult.hasErrors()) {
                
                model.addAttribute("errorMessage", postAddBindingResult.getAllErrors().toString());
                return "index";
            } else {
                
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Date date = new Date();
                
                String sql = "INSERT INTO advertisement_info (u_id, address, type, quantity, "
                        + "deadline, availability, house_rent, utility_cost, provided_fasility, post_date) "
                        + "VALUES ("
                        + "'" + advertisementModel.getPosterID() + "', "
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
                ConnectToDatabase connectToDatabase = (ConnectToDatabase)GetBeans.getBean("connectToDatabase");
                connectToDatabase.getResult(sql);
                
                sql = "SELECT * FROM advertisement_info WHERE u_id='"
                        + advertisementModel.getPosterID()
                        + "' ORDER BY post_id DESC";
                
                ResultSet resultSet = connectToDatabase.getResult(sql);
                model.addAttribute("resultSet", resultSet);
                
                
                return "my_posted_adds";
            }
        } catch (Exception e) {

            model.addAttribute("errorMessage", e.toString());
            return "index";
        }
    }
}