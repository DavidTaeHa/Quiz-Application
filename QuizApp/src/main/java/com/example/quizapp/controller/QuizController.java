package com.example.quizapp.controller;

import com.example.quizapp.domain.QuizInstance;
import com.example.quizapp.service.FeedbackService;
import com.example.quizapp.service.QuizService;
import com.example.quizapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

@Controller
@SessionAttributes({"userName","password","qa","index","topic","time"})
public class QuizController {
    UserService userService;
    FeedbackService feedbackService;
    QuizService quizService;

    @Autowired
    public QuizController(UserService userService, FeedbackService feedbackService, QuizService quizService){
        this.userService = userService;
        this.feedbackService = feedbackService;
        this.quizService = quizService;
    }

    @PostMapping("/login")
    public String login(Model model, HttpServletRequest req, @RequestParam String username_input, @RequestParam String password_input){
        if (userService.checkPassword(username_input, password_input)) {
            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            HttpSession newSession = req.getSession(true);
            model.addAttribute("userName", username_input);
            model.addAttribute("password", password_input);
            newSession.setAttribute("userName", username_input);
            newSession.setMaxInactiveInterval(1000);
            //return "redirect:/mainpage";
            return "mainpage";
        }
        model.addAttribute("exception", "Invalid Username/Password combination");
        return "index";
    }

    @PostMapping("/register")
    public String register(Model model, @RequestParam String username_input,
                           @RequestParam String password_input, @RequestParam String confirm_password_input) throws SQLException {
        if(username_input.isEmpty() || password_input.isEmpty() || confirm_password_input.isEmpty()){
            model.addAttribute("fill_error", "Every box must be filled!");
            return "register";
        }
        else if (userService.isUser(username_input)) {
            model.addAttribute("name_error", "Username already taken");
            return "register";
        }
        else if(!password_input.equals(confirm_password_input)){
            model.addAttribute("match_error", "Passwords do not match");
            return "register";
        }
        userService.addUsertoDB(username_input, password_input);
        model.addAttribute("message", "Register Successful");
        return "index";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, SessionStatus sessionStatus){
        sessionStatus.setComplete();
        HttpSession session = request.getSession(false);
        if (session != null) {
            System.out.println("test");
            session.invalidate();
        }
        return "index";
    }

    @GetMapping("/mainpage")
    public String mainpage(HttpServletRequest req,Model model){

        HttpSession oldSession = req.getSession(false);
        if (oldSession == null) {
            model.addAttribute("exception", "No Authorization");
            model.addAttribute("url", req.getRequestURL());
            return "error";
        }
        model.addAttribute("userName",model.getAttribute("userName"));
        return "mainpage";
    }

    @PostMapping("/feedback")
    public String createFeedback(Model model, @RequestParam int stars, @RequestParam String feedback) throws SQLException {
        if(feedback.isEmpty()){
            model.addAttribute("fill_error", "Every box must be filled!");
            return "feedback";
        }
        feedbackService.addFeedback(stars, feedback);
        model.addAttribute("message","Feedback Sent!");
        return "feedback";
    }

    @GetMapping("/quiz")
    public String getQuiz(Model model, @RequestParam String topic){
        QuizInstance quizInstance = quizService.createQuiz(topic);
        model.addAttribute("index",0);
        model.addAttribute("qa",quizInstance);
        model.addAttribute("topic",topic);
        model.addAttribute("time",System.currentTimeMillis());
        return "quiz";
    }

    @PostMapping("/answer")
    public String advanceQuiz(Model model,@RequestParam(value = "mc",required = false) String mc, @RequestParam("action") String action,@RequestParam Integer index){
        QuizInstance currQuiz = (QuizInstance) model.getAttribute("qa");
        if(action.equals("next")){
            if(mc != null){
                currQuiz.getAnswerInputs().get(index).setAnswerInput(mc);
            }
            model.addAttribute("qa",currQuiz);
            model.addAttribute("index",index+1);
            return "quiz";
        }
        if(action.equals("previous")){
            if(mc != null){
                currQuiz.getAnswerInputs().get(index).setAnswerInput(mc);
            }
            model.addAttribute("qa",currQuiz);
            model.addAttribute("index",index-1);
            return "quiz";
        }
        if(!action.equals("next") && !action.equals("previous") && !action.equals("finish")){
            if(mc != null){
                currQuiz.getAnswerInputs().get(index).setAnswerInput(mc);
            }
            model.addAttribute("qa",currQuiz);
            model.addAttribute("index",Integer.parseInt(action)-1);
            return "quiz";
        }

        if(mc != null){
            currQuiz.getAnswerInputs().get(index).setAnswerInput(mc);
        }
        model.addAttribute("qa",currQuiz);
        for(int i = 0; i < currQuiz.getAnswerInputs().size(); i++){
            if(currQuiz.getAnswerInputs().get(index).getAnswerInput() == null){ // change to null
                model.addAttribute("index",index);
                model.addAttribute("exception","All answers must be filled!");
                return "quiz";
            }
        }

        //Calculate and display the result
        int score = 0;
        for(int i = 0; i < currQuiz.getAnswerInputs().size();i++){ // change to equals
            if(currQuiz.getAnswerInputs().get(i).getAnswerInput()
                    .equals(currQuiz.getAnswerInputs().get(i).getQuestion().getAnswer())){
                score++;
                currQuiz.getAnswerInputs().get(i).setCorrect("O");
            }
        }
        if(score >= 6){
            model.addAttribute("result","You Passed!");
        }
        else{
            model.addAttribute("result","You Failed!");
        }
        model.addAttribute("score",score);
        model.addAttribute("topic",model.getAttribute("topic"));
        model.addAttribute("userName",model.getAttribute("userName"));
        long time = System.currentTimeMillis() - (long)model.getAttribute("time");
        long totalSeconds = time/1000;
        long minutes = totalSeconds/60;
        String min = String.valueOf(minutes);
        if(min.length() == 1){
            min = "0" + min;
        }
        long seconds = totalSeconds % 60;
        String sec = String.valueOf(seconds);
        if(sec.length() == 1){
            sec = "0" + sec;
        }
        model.addAttribute("minutes",min);
        model.addAttribute("seconds",sec);
        return "result";
    }

}
