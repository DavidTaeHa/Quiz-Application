package com.example.quizapp.domain;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class QuizInstance {
    List<Answer> answerInputs;
}
