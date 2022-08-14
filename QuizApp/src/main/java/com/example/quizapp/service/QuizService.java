package com.example.quizapp.service;

import com.example.quizapp.dao.QuizDAO;
import com.example.quizapp.domain.Answer;
import com.example.quizapp.domain.Question;
import com.example.quizapp.domain.QuizInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuizService {

    private QuizDAO quizDAO;

    @Autowired
    public QuizService(QuizDAO quizDAO){
        this.quizDAO = quizDAO;
    }

    public QuizInstance createQuiz(String topic){
        List<Question> questions = quizDAO.getQuestions(topic);

        List<Answer> answerInput = questions.stream().map(qs -> new Answer(qs,null,"X")).collect(Collectors.toList());

        QuizInstance quizInstance = new QuizInstance(answerInput);

        return quizInstance;
    }
}
