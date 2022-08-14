package com.example.quizapp.service;

import com.example.quizapp.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class UserService {

    public UserDAO userDAO;

    @Autowired
    public UserService(UserDAO userDAO){
        this.userDAO = userDAO;
    }

    //Checks if username and password pair is valid
    public boolean checkPassword(String username, String password){
        if(username == null || password == null){
            return false;
        }
        int index;
        //User is found within the database
        if((index = userDAO.getUser(username)) != -1){
            if(UserDAO.userList.get(index).getPassword().equals(password)){
                return true;
            }
        }
        return false;
    }

    //Check if username is taken
    public boolean isUser(String username){
        if(username == null){
            return false;
        }
        //User is found within the database
        if(userDAO.getUser(username) != -1){
            return true;
        }
        return false;
    }

    //Adds user to the database
    public void addUsertoDB(String username, String password) throws SQLException {
        userDAO.addUser(username, password);
    }
}
