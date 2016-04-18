/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.resultsets;

import com.models.UserInformation;
import com.util.ConnectToDatabase;
import com.util.GetBeans;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ashik
 */
public class MessagesAndNotifications {
    
    public ResultSet getMessages() {

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

    public int getMessageCount() {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
            UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");

            String sql = "SELECT COUNT(*) AS numbers FROM messages WHERE (receiver_id='"
                    + userInformation.getU_id()
                    + "' AND seen='N')";

            int numberOfMessages = 0;
            ResultSet resultSet = connectToDatabase.getResult(sql);

            if (resultSet.next()) {

                numberOfMessages = Integer.parseInt(resultSet.getString("numbers"));
            }

            return numberOfMessages;
        } catch (SQLException | NumberFormatException e) {

            return 0;
        }
    }
}
