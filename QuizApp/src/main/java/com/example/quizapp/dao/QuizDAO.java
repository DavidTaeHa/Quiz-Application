package com.example.quizapp.dao;

import com.example.quizapp.SQLDS;
import com.example.quizapp.domain.Question;
import com.example.quizapp.domain.User;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class QuizDAO {

    public static List<Question> questionList;
    private DataSource ds;
    private Connection conn;
    private Statement st;

    private static final String SELECT_QUESTIONS = "SELECT * FROM question NATURAL JOIN quiz";

    public QuizDAO() throws SQLException {
        questionList = new ArrayList<>();
        ds = SQLDS.getDs();
        conn = ds.getConnection();
        st = conn.createStatement();
        ResultSet rs = st.executeQuery(SELECT_QUESTIONS);
        while(rs.next()){
            Question question = Question.builder()
                    .topic(rs.getString("quiz_name"))
                    .description(rs.getString("question_description"))
                    .mc1(rs.getString("mc1"))
                    .mc2(rs.getString("mc2"))
                    .mc3(rs.getString("mc3"))
                    .mc4(rs.getString("mc4"))
                    .answer(rs.getString("answer"))
                    .build();
            questionList.add(question);
        }
        if (st != null) {
            st.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public List<Question> getQuestions(String topic){
        List<Question> temp = new ArrayList<>();
        for(int i = 0; i < questionList.size(); i++){
            if(questionList.get(i).getTopic().equals(topic)){
                temp.add(questionList.get(i));
            }
        }
        Collections.shuffle(temp);
        return temp.subList(0,10);
    }

}
