package com.example.quizapp.dao;

import com.example.quizapp.SQLDS;
import com.example.quizapp.domain.User;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Repository
public class UserDAO {
    //public static List<User> userList = Arrays.asList(new User("John", "12345"));
    public static List<User> userList;
    private DataSource ds;
    private Connection conn;
    private Statement st;
    private PreparedStatement ps;

    private static final String SELECT_ALL_USER = "SELECT * FROM user";
    private static final String ADD_USER = "INSERT INTO USER (`username`, `password`) VALUES (?,?)";

    public UserDAO() throws SQLException {
        ds = SQLDS.getDs();

        //Get users from DB
        userList = new ArrayList<>();
        conn = ds.getConnection();
        st = conn.createStatement();
        ResultSet rs = st.executeQuery(SELECT_ALL_USER);
        while(rs.next()){
            User user = User.builder()
                    .username(rs.getString("username"))
                    .password(rs.getString("password"))
                    .build();
            userList.add(user);
        }
        if (st != null) {
            st.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    //Return index of the matching user
    public int getUser(String user){
        for(int i = 0; i < userList.size(); i++){
            if(userList.get(i).getUsername().equals(user)){
                return i;
            }
        }
        return -1;
    }

    //Adds user to the database
    public void addUser(String username, String password) throws SQLException {
        conn = ds.getConnection();
        ps = conn.prepareStatement(ADD_USER);
        ps.setString(1,username);
        ps.setString(2,password);
        ps.executeUpdate();
        userList.add(User.builder().username(username).password(password).build());
        if (st != null) {
            st.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
}
