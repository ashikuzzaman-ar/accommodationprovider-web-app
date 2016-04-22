/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.models.resultsets;

import com.util.ConnectToDatabase;
import com.util.GetBeans;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ashik
 */
public class MessagesAndNotifications {
    
    public ResultSet getMessages(String user_id) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
             
            String sql = "SELECT messages.sender_id, messages.receiver_id, user_info.name "
                    + "FROM messages, user_info WHERE (receiver_id='"
                    + user_id
                    + "' AND seen='N' AND messages.sender_id=user_info.u_id) "
                    + "ORDER BY last_edited LIMIT 0,6";

            return connectToDatabase.getResult(sql);
        } catch (Exception e) {

            return null;
        }
    }

    public int getMessageCount(String user_id) {

        try {

            ConnectToDatabase connectToDatabase = (ConnectToDatabase) GetBeans.getBean("connectToDatabase");
             
            String sql = "SELECT COUNT(*) AS numbers FROM messages WHERE (receiver_id='"
                    + user_id
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
