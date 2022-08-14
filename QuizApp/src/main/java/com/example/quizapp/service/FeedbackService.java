package com.example.quizapp.service;

import com.example.quizapp.SQLDS;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Service
public class FeedbackService {
    private DataSource ds;

    private Connection conn;

    private PreparedStatement ps;

    private static final String ADD_FEEDBACK = "INSERT INTO FEEDBACK (`stars`, `feedback`) VALUES (?,?)";

    public FeedbackService(){
        ds = SQLDS.getDs();
    }

    public void addFeedback(int stars, String feedback) throws SQLException {
        conn = ds.getConnection();
        ps = conn.prepareStatement(ADD_FEEDBACK);
        ps.setInt(1,stars);
        ps.setString(2,feedback);
        ps.executeUpdate();
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
}
